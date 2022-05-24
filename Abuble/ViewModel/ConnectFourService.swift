//
//  ConnectFourViewModel.swift
//  Mini-Tangivel
//
//  Created by Marco Zulian on 15/05/22.
//

import SwiftUI

class ConnectFourService: ObservableObject {
    
    private var game: ConnectFour
    private var player_1: ConnectFourPlayer
    private var player_2: ConnectFourPlayer
    private var player: Int
    var delegate: ConnectFourDelegate?
    var isOver: Bool { game.isGameOver(state: currentGameState) }
    
    @Published private(set) var currentGameState: ConnectFourState {
        didSet {
            if !currentGameState.is_over {
                let next_player = player == 1 ? player_1 : player_2
                if var next_player = next_player as? AlphaBetaConnectFourPlayer {
                    let possible_actions = game.getPossibleActions(at: currentGameState)
                    let selected_action = next_player.selectAction(at: currentGameState, from: possible_actions)
                    if let delegate = delegate {
                        delegate.handle(action: selected_action, for: player)
                    }
                    player = currentGameState.move_count % 2 == 0 ? 2 : 1
                    currentGameState = game.perform(action: selected_action, at: currentGameState)
                }
            }
        }
    }
    
    init(game: ConnectFour, player_1: ConnectFourPlayer, player_2: ConnectFourPlayer) {
        self.game = game
        self.currentGameState = game.initial_state
        self.player_1 = player_1
        self.player_2 = player_2
        self.player = 1
    }
    
    func startGame() {
        resetGame()
        
        let next_player = player == 1 ? player_1 : player_2
        if var next_player = next_player as? AlphaBetaConnectFourPlayer {
            let possible_actions = game.getPossibleActions(at: currentGameState)
            let selected_action = next_player.selectAction(at: currentGameState, from: possible_actions)
            if let delegate = delegate {
                delegate.handle(action: selected_action, for: player)
            }
            player = currentGameState.move_count % 2 == 0 ? 2 : 1
            currentGameState = game.perform(action: selected_action, at: currentGameState)
        }
    }
    
    func check(action: ConnectFourAction) {
        let next_player = player == 1 ? player_1 : player_2
        guard let _ = next_player as? RealConnectFourPlayer else { return }
        if currentGameState.is_over { return }
        
        let possible_actions = game.getPossibleActions(at: currentGameState)
        if possible_actions.contains(action) {
            player = currentGameState.move_count % 2 == 0 ? 2 : 1
            currentGameState = game.perform(action: action, at: currentGameState)
        }
    }
    
    func isPossible(action: ConnectFourAction) -> Bool {
        let possible_actions = game.getPossibleActions(at: currentGameState)
        return possible_actions.contains(action)
    }
    
    func resetGame() {
        game = ConnectFour(board_width: 8, board_height: 8)
        player = 1
        currentGameState = game.initial_state
    }
    
}

protocol ConnectFourDelegate {
    func handle(action: ConnectFourAction, for player: Int)
}
