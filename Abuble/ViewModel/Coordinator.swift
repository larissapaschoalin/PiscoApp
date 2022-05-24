//
//  Coordinator.swift
//  Abuble
//
//  Created by Marco Zulian on 20/05/22.
//

import Foundation
import SwiftUI
import Combine

class Coordinator: ObservableObject {
    
    let user: User
    @Published var matrix: Matrix
    @Published var isConnected: Bool = false
    @Published var connectionError: Bool = false
//    var lastMoveCoord: Int? = nil
//    var lastMoveDoneByCoord: String? = nil
    
    @Published private var room: GameRoom? {
        // MARK: Percebeu mudança de estado
        didSet {
            guard let room = room else {
                isInsideRoom = false
                return
            }
            
            isInsideRoom = user.id == room.hostId || user.id == room.opponentId
        }
    }
    @Published var isInsideRoom: Bool = false
    @Published var winner: String? = nil
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: Variaveis para a sala
    var code: String { room?.code ?? "Fail" }
    var isFriendOn: Bool { room?.opponentId != nil }
    var isHost: Bool { room?.hostId == user.id }
    
    var game: ConnectFourService? = nil
    
    init(user: User) {
        self.user = user
        if let persisted = PersistenceService.shared.retrieve(Matrix.self, fromKey: "matrix") {
            self.matrix = persisted
        } else {
            self.matrix = Matrix(cells: Cell.populate())
            PersistenceService.shared.save(matrix, key: "matrix")
        }
        PeripheralService.shared.addListener(self)
    }
    
    // MARK: Intents
    func tryToConnect() {
        PeripheralService.shared.connect()
    }
    
    func saveDrawing(_ matrix: Matrix) {
        self.matrix = matrix
        PeripheralService.shared.setPisco(to: matrix)
        PersistenceService.shared.save(matrix, key: "matrix")
    }
    
    func hostGame() {
        FirebaseService.shared.createNewGame(with: user.id)
        FirebaseService.shared.$room
            .assign(to: \.room, on: self)
            .store(in: &cancellables)
    }
    
    func joinGame(withCode code: String) {
        FirebaseService.shared.joinGame(with: code, userId: user.id)
        FirebaseService.shared.$room
            .assign(to: \.room, on: self)
            .store(in: &cancellables)
    }
    
    func leaveRoom() {
        guard let _ = room else { return }
        FirebaseService.shared.quitGame(with: user.id)
    }
    
    func startGame() {
        let connectFour = ConnectFour(board_width: 8, board_height: 8)
        if let _ = room?.opponentId {
            game = ConnectFourService(game: connectFour, player_1: RealConnectFourPlayer(game: connectFour), player_2: RealConnectFourPlayer(game: connectFour))
        } else {
            game = ConnectFourService(game: connectFour, player_1: RealConnectFourPlayer(game: connectFour), player_2: AlphaBetaConnectFourPlayer(game: connectFour))
        }
        game?.delegate = self
        game?.startGame()
        PeripheralService.shared.resetPisco()
//        lastMoveCoord = nil
//        lastMoveDoneByCoord = nil
        room?.lastMove = nil
        room?.lastMoveDoneBy = nil
        room?.playerTurn = room!.hostId
        FirebaseService.shared.updateGame(room!)
    }
    
}

extension Coordinator: PeripheralViewModelListener {
    func handleClick(at row: Int) {
        guard room != nil else { return }
        guard game != nil else { return }
        
        if game!.isOver && user.id == room!.hostId {
            game!.resetGame()
            PeripheralService.shared.resetPisco()
//            lastMoveCoord = nil
//            lastMoveDoneByCoord = nil
            room?.lastMove = nil
            room?.lastMoveDoneBy = nil
            room?.playerTurn = room?.hostId
            FirebaseService.shared.updateGame(room!)
            return
        }
        
        if room!.playerTurn == user.id && game!.isPossible(action: ConnectFourAction(column: row)) {
            // MARK: Realiza ação
            room?.lastMove = row
            room?.lastMoveDoneBy = user.id
            room?.playerTurn = room?.opponentId
            FirebaseService.shared.updateGame(room!)
            perform()
        }
    }
    
    func connected() {
        connectionError = false
        isConnected = true
        PeripheralService.shared.setPisco(to: matrix)
    }
    
    func disconnected() {
        connectionError = true
        isConnected = false
    }
    
    func perform() {
        guard room != nil else { return }
        guard game != nil else { return }
        
        if let lastMove = room!.lastMove,
           let lastPlayer = room!.lastMoveDoneBy {
//             if lastMove != lastMoveCoord && lastPlayer != lastMoveDoneByCoord {
                PeripheralService.shared.dropPiece(at: lastMove, color: lastPlayer == room!.hostId ? UIColor.blue : UIColor.red )
                game?.check(action: ConnectFourAction(column: lastMove))
//                lastMoveCoord = lastMove
//                lastMoveDoneByCoord = lastPlayer
                
                if let winner = game?.currentGameState.winner  {
                    self.winner = winner == 1 ? room!.hostId : room!.opponentId
//                }
            }
        }
    }
}

extension Coordinator: ConnectFourDelegate {
    func handle(action: ConnectFourAction, for player: Int) {
        guard room != nil else { return }
        guard game != nil else { return }
        
        // MARK: Realiza ação
        self.room!.lastMove = action.column
        self.room!.lastMoveDoneBy = player == 1 ? room!.hostId : room!.opponentId ?? "AI"
        self.room!.playerTurn = player == 1 ? room!.opponentId ?? "AI" : room!.hostId
        FirebaseService.shared.updateGame(room!)
        perform()
//        self.room!.gameState = game!.currentGameState.grid
    }
}
