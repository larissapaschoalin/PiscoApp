//
//  GameRoomView.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 19/05/22.
//

import SwiftUI

struct GameRoomView: View {
    @State var micOpen: Bool = true
    @State var audioOpen: Bool = true
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
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
            
            Text("selecionar jogo")
                .font(Font.custom("Montserrat-Regular", size: 20))
                .foregroundColor(Color("DarkColor"))
            
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
            
            Button {
                print("play")
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
            
        }
        .padding(.horizontal, 20)
        .background(Color("BackgroundColor").ignoresSafeArea())
    }
}

struct GameRoomView_Previews: PreviewProvider {
    static var previews: some View {
        GameRoomView()
    }
}
