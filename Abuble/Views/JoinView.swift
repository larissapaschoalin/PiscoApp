//
//  JoinView.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 19/05/22.
//

import SwiftUI
import Combine

struct JoinView: View {
    
    @ObservedObject var coordinator: Coordinator
    @State var code: String = ""
    @Binding var isJoining: Bool
    var isFull: Bool { code.count == 6 }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button { isJoining = false } label: { Image("X").padding(30) }
            }
            Spacer()
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
            
            Spacer(minLength: 50)
            
            Text("Insira o código")
                .font(Font.custom("Montserrat-Regular", size: 20))
                .foregroundColor(Color("DarkColor"))
            
            ZStack {
                if code.isEmpty {
                    Text("000-000")
                        .foregroundColor(Color("EmptyText"))
                }
                TextField("", text: $code)
            }
            .font(Font.custom("PressStart2P-Regular", size: 24))
            .foregroundColor(Color("DarkColor"))
            .padding(.init(top: 35, leading: 45, bottom: 35, trailing: 45))
            .frame(width: 260)
            .background(Rectangle().stroke(lineWidth: 5).foregroundColor(Color("DarkColor")))
            .onReceive(Just(code)) { _ in limitText(6) }
    
            Spacer(minLength: 110)
            
            Button {
                coordinator.joinGame(withCode: code)
            } label: {
                ZStack {
                    Image(isFull ? "Button" : "DisabledButton" )
                    
                    Text("Join")
                        .font(Font.custom("PressStart2P-Regular", size: 30))
                        .foregroundColor(isFull ? Color("DarkColor") : Color("BackgroundColor"))
                        .textCase(.uppercase)
                        .padding(.trailing)
                    
                }
            }.disabled(!isFull)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color("BackgroundColor").ignoresSafeArea())
    }
    
    func limitText(_ upper: Int) {
        if code.count > upper {
            code = String(code.prefix(upper))
        }
        
        code = code.uppercased()
    }
}
