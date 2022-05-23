//
//  MiniGameView.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 20/05/22.
//

import SwiftUI

struct MiniGameView: View {
    var miniGame: MiniGame
    
    var body: some View {
        Text("\(miniGame.name)")
            .font(Font.custom("PressStart2P-Regular", size: 20))
            .foregroundColor(Color("BackgroundColor"))
            .textCase(.uppercase)
            .frame(width: UIScreen.main.bounds.width - 200, height: 80, alignment: .center)
            .background(
                Rectangle()
                    .foregroundColor(Color("DarkColor"))
            )
    }
}

struct MiniGameView_Previews: PreviewProvider {
    static var previews: some View {
        MiniGameView(miniGame: MiniGame(name: "Teste4", show: true))
    }
}
