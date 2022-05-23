//
//  GameRoomView.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 19/05/22.
//

import SwiftUI

struct GameRoomView: View {
    @EnvironmentObject var user: User
    
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
            
            Spacer()
            
            VStack {
                Text("código da sala")
                    .font(Font.custom("Montserrat-Regular", size: 20))
                    .foregroundColor(Color("DarkColor"))
                
                
                Text("xxx-xxx")
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
                    
                    if let photo = user.photo {
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
                
                    
                    if friendOn == true {
                        
                        if let photo = user.photo {
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
            
            if gameOn == false {
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



struct GameRoomView_Previews: PreviewProvider {
    static var previews: some View {
        GameRoomView()
    }
}
