//
//  JoinView.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 19/05/22.
//

import SwiftUI

struct JoinView: View {
    var isFull: Bool = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            
            Button {
                print("lalala")
            } label: {
                ZStack {
                    Image(isFull ? "Button" : "DisabledButton")
                    
                    Text("Join")
                        .font(Font.custom("PressStart2P-Regular", size: 30))
                        .foregroundColor(isFull ? Color("DarkColor") : Color("BackgroundColor"))
                        .textCase(.uppercase)
                        .padding(.trailing)
                    
                }
            }
            
            
            Spacer()
            
        }
        .padding(.horizontal)
        .background(Color("BackgroundColor").ignoresSafeArea())
        
    }
}

struct JoinView_Previews: PreviewProvider {
    static var previews: some View {
        JoinView()
    }
}
