//
//  HomeView.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 18/05/22.
//

import SwiftUI

struct HomeView: View {
    
    let matrix: Matrix = Matrix(cells: Cell.populate())
    
    var isConnected: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Hey,Nome")
                        .font(Font.custom("PressStart2P-Regular", size: 26))
                        .foregroundColor(.black)

                    Text("bora descansar?")
                        .font(Font.custom("Montserrat-Regular", size: 26))
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Circle()
                    .frame(width: 80, height: 80)
            }
            
            if isConnected == true {
                VStack(alignment: .leading, spacing: 6) {
                    
                    HStack {
                        Text("Sua telinha")
                            .font(Font.custom("Montserrat-Regular", size: 20))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        NavigationLink("Editar", destination: PaintView())
                            .font(Font.custom("Montserrat-Regular", size: 20))
                            .foregroundColor(.green)
                        
                    }
                    
                    MatrixView(matrix: matrix)
                }
                
                VStack(spacing: 20) {
                    Button{
                        print("a")
                    } label: {
                        ZStack {
                            Image("Button")
                            
                            Text("Play")
                                .font(Font.custom("PressStart2P-Regular", size: 40))
                                .foregroundColor(Color("BackgroundColor"))
                                .textCase(.uppercase)
                        }
                    }
                    
                    Button{
                        print("b")
                    } label: {
                        ZStack {
                            Image("Button")
                            
                            Text("Host")
                                .font(Font.custom("PressStart2P-Regular", size: 40))
                                .foregroundColor(Color("BackgroundColor"))
                                .textCase(.uppercase)
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
                        print("a")
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
                        print("b")
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
            Spacer()
        }
        .padding(.horizontal)
        .background(Color("BackgroundColor").ignoresSafeArea())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
