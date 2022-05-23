//
//  HomeView.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 18/05/22.
//

import SwiftUI
import GameKit

struct HomeView: View {
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        
        VStack(spacing: 30) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Hey,\(coordinator.user.name)")
                        .font(Font.custom("PressStart2P-Regular", size: 26))
                        .foregroundColor(Color("DarkColor"))
                    
                    Text("bora descansar?")
                        .font(Font.custom("Montserrat-Regular", size: 26))
                        .foregroundColor(Color("DarkColor"))
                }
                
                Spacer()
                
                
                if let photo = coordinator.user.photo {
                    photo
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .background(
                            Circle()
                                .stroke(lineWidth: 6)
                                .foregroundColor(Color("DarkColor"))
                        )
                    
                } else {
                    Circle()
                        .frame(width: 80, height: 80)
                }
            }
            
            
            if coordinator.isConnected {
                VStack(alignment: .leading, spacing: 6) {
                    
                    HStack {
                        Text("Sua telinha")
                            .font(Font.custom("Montserrat-Regular", size: 20))
                            .foregroundColor(Color("DarkColor"))
                        
                        Spacer()
                        
                        NavigationLink("Editar", destination: PaintView(coordinator: coordinator))
                            .font(Font.custom("Montserrat-Regular", size: 20))
                            .foregroundColor(Color("YellowColor"))
                        
                    }
                    
                    MatrixView(matrix: coordinator.matrix)
                }
                
            } else {
                
                VStack(spacing: 2) {
                    ZStack {
                        
                        Image("DashStroke")
                        
                        VStack {
                            Image("Connection")
                            
                            Text("Conecte seu Pisco para jogar")
                                .font(Font.custom("Montserrat-Regular", size: 26))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                        }
                    }.onTapGesture {
                        coordinator.tryToConnect()
                    }
                    if (coordinator.connectionError) {
                        Text("Falha ao conectar, tente novamente!")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
            }
                
            VStack(spacing: 20) {
                SquareButton(isEnabled: $coordinator.isConnected) {
                    print("a")
                } content: {
                    Text("Play")
                        .font(Font.custom("PressStart2P-Regular", size: 30))
                        .foregroundColor(Color("BackgroundColor"))
                        .textCase(.uppercase)
                        .padding(.top, 6)
                }
                
                SquareButton(isEnabled: $coordinator.isConnected) {
                    coordinator.hostGame()
                } content: {
                    Text("Host")
                        .font(Font.custom("PressStart2P-Regular", size: 30))
                        .foregroundColor(Color("BackgroundColor"))
                        .textCase(.uppercase)
                        .padding(.top, 6)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .background(Color("BackgroundColor").ignoresSafeArea())
        .fullScreenCover(isPresented: $coordinator.isInsideRoom, onDismiss: {}, content: { GameRoomView() })
    }
}
