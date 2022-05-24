//
//  GameRoomView.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 19/05/22.
//

import SwiftUI

struct GameRoomView: View {
    @ObservedObject var coordinator: Coordinator
    
    @State var micOpen: Bool = true
    @State var audioOpen: Bool = true
    @State var friendOn: Bool = true
    @State var gameOn: Bool = false
    @State var final: Bool = false
    @State var win: Bool = false
    
    @State var currentIndex: Int = 0
    @State var selectedGame: MiniGame = MiniGame(name: "Ligue4", show: true)
    
    
    
    @State var x: CGFloat = 0
    @State var count: CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 100
    //@State var isNextButtonPressed: Bool = false
    var miniGames: [MiniGame] = [
        MiniGame(name: "Dama", show: false),
        MiniGame(name: "Ligue4", show: false),
        MiniGame(name: "BatNaval", show: false)
    ]
    
    func getMid()->Int {
        return miniGames.count / 2
    }
    
    func startGame() {
        gameOn = true
    }
    
    func endGame() {
        final.toggle()
    }
    
    //    func playAgain() {
    //        final = false
    //    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            
            HStack {
                Spacer()
                Button { coordinator.leaveRoom() } label: { Image("X").padding(30) }
            }
            Spacer()
            
            VStack {
                Text("código da sala")
                    .font(Font.custom("Montserrat-Regular", size: 20))
                    .foregroundColor(Color("DarkColor"))
                
                
                Text(coordinator.code.prefix(3) + "-" + coordinator.code.suffix(3))
                    .font(Font.custom("PressStart2P-Regular", size: 20))
                    .foregroundColor(Color("DarkColor"))
                    .padding()
                    .background(
                        Rectangle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(Color("DarkColor"))
                    )
                
            }
            
            if final == true {
                
                Image(win ? "HappyFace" : "SadFace")
                
                VStack(spacing: 6) {
                    Text(win ? "Você" : "Game")
                        .font(Font.custom("PressStart2P-Regular", size: 40))
                        .foregroundColor(Color("DarkColor"))
                        .textCase(.uppercase)
                    
                    Text(win ? "Venceu" : "Over")
                        .font(Font.custom("PressStart2P-Regular", size: 40))
                        .foregroundColor(Color("DarkColor"))
                        .textCase(.uppercase)
                }
                
                VStack{
                    Text("aperte qualquer botão do")
                        .font(Font.custom("Montserrat-Regular", size: 20))
                        .foregroundColor(Color("DarkColor"))
                    
                    Text("Pisco para jogar novamente")
                        .font(Font.custom("Montserrat-Regular", size: 20))
                        .foregroundColor(Color("DarkColor"))
                }

            } else {
                
                HStack (spacing: 20) {
                    
                    if let photo = coordinator.user.photo {
                        photo
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .background(
                                Circle()
                                    .stroke(lineWidth: 6)
                                    .foregroundColor(Color("DarkColor"))
                            )
                        
                    } else {
                        Circle()
                            .frame(width: 150, height: 150)
                    }
                
                    
                    if coordinator.isFriendOn {
                        
                        // MARK: Ajuste segunda foto
                        if let photo = coordinator.user.photo {
                            photo
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .background(
                                    Circle()
                                        .stroke(lineWidth: 6)
                                        .foregroundColor(Color("DarkColor"))
                                )
                        } else {
                            Circle()
                                .frame(width: 150, height: 150)
                        }
                    }
                }
            }
            
            MiniGameView(miniGame: selectedGame)

            
            HStack(spacing: 30) {
                Button {
                    micOpen.toggle()
                    
                } label: {
                    Image(micOpen ? "MicOpen" : "MicClosed")
                }
                
                Button {
                    audioOpen.toggle()
                } label: {
                    Image(audioOpen ? "AudioOpen" : "AudioClosed")
                }
            }
            
            if gameOn {
                Button {
                    startGame()
                } label: {
                    ZStack {
                        Image("Button")
                        
                        Text("Play")
                            .font(Font.custom("PressStart2P-Regular", size: 30))
                            .foregroundColor(Color("DarkColor"))
                            .textCase(.uppercase)
                            .padding(.trailing, 6)
                    }
                }
            } else {
                Button {
                    endGame()
                } label: {
                    Text(final ? "play again" : "acabou")
                }
            }
            
            Spacer()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.horizontal, 20)
        .background(Color("BackgroundColor").ignoresSafeArea())
        
    }
}

