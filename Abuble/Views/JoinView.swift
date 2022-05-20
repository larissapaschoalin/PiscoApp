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
            
            if isFull == true {
                Button {
                    print("lalala")
                } label: {
                    ZStack {
                        Image("Button")
                        
                        Text("Join")
                            .font(Font.custom("PressStart2P-Regular", size: 30))
                            .foregroundColor(Color(.black))
                            .textCase(.uppercase)
                            .padding(.trailing)
                        
                    }
                }
                
            } else {
                Button {
                    print("lalala")
                } label: {
                    ZStack {
                        Image("DisabledButton")
                        
                        Text("Join")
                            .font(Font.custom("PressStart2P-Regular", size: 30))
                            .foregroundColor(Color("BackgroundColor"))
                            .textCase(.uppercase)
                            .padding(.top, 6)
                    }
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
