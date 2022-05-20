//
//  HomeView.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 18/05/22.
//

import SwiftUI
import GameKit

struct HomeView: View {
    @EnvironmentObject var user: User
    let matrix: Matrix = Matrix(cells: Cell.populate())
    
    var isConnected: Bool = true
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Hey,\(user.name)")
                        .font(Font.custom("PressStart2P-Regular", size: 26))
                        .foregroundColor(Color("DarkColor"))
                    
                    Text("bora descansar?")
                        .font(Font.custom("Montserrat-Regular", size: 26))
                        .foregroundColor(Color("DarkColor"))
                }
                
                Spacer()
                
                
                if let photo = user.photo {
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
            
            
            if isConnected == true {
                VStack(alignment: .leading, spacing: 6) {
                    
                    HStack {
                        Text("Sua telinha")
                            .font(Font.custom("Montserrat-Regular", size: 20))
                            .foregroundColor(Color("DarkColor"))
                        
                        Spacer()
                        
                        NavigationLink("Editar", destination: PaintView())
                            .font(Font.custom("Montserrat-Regular", size: 20))
                            .foregroundColor(Color("YellowColor"))
                        
                    }
                    
                    MatrixView(matrix: matrix)
                }
                
                
                VStack(spacing: 20) {
                    Button{
                        print("Entrar")
                    } label: {
                        ZStack {
                            Image("Button")
                            
                            Text("Play")
                                .font(Font.custom("PressStart2P-Regular", size: 30))
                                .foregroundColor(Color(.black))
                                .textCase(.uppercase)
                                .padding(.trailing)
                        }
                    }
                    
                    Button{
                        print("Entrar host")
                    } label: {
                        ZStack {
                            Image("Button")
                            
                            Text("Host")
                                .font(Font.custom("PressStart2P-Regular", size: 30))
                                .foregroundColor(Color(.black))
                                .textCase(.uppercase)
                                .padding(.trailing)
                        }
                    }
                    
                }
                
            } else {
                
                ZStack {
                    
                    Image("DashStroke")
                    
                    VStack {
                        Image("Connection")
                        
                        Text("Conecte seu Pisco para jogar")
                            .font(Font.custom("Montserrat-Regular", size: 26))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                }
                
                
                VStack(spacing: 20) {
                    Button {
                        print("Não pode entrar")
                    } label: {
                        ZStack {
                            Image("DisabledButton")
                            
                            Text("Play")
                                .font(Font.custom("PressStart2P-Regular", size: 30))
                                .foregroundColor(Color("BackgroundColor"))
                                .textCase(.uppercase)
                                .padding(.top, 6)
                        }
                    }
                    
                    Button {
                        print("Não pode entrar")
                    } label: {
                        ZStack {
                            Image("DisabledButton")
                            
                            Text("Host")
                                .font(Font.custom("PressStart2P-Regular", size: 30))
                                .foregroundColor(Color("BackgroundColor"))
                                .textCase(.uppercase)
                                .padding(.top, 6)
                        }
                    }
                }
            }
            
        }
        .padding(.horizontal, 20)
        .background(Color("BackgroundColor").ignoresSafeArea())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
