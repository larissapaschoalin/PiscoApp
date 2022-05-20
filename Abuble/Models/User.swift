//
//  User.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 19/05/22.
//

import SwiftUI
import GameKit

class User: ObservableObject {
    @Published var name: String = ""
    @Published var photo: Image?
    
    func from(gameCenter user: GKLocalPlayer) {
        self.name = user.displayName
        user.loadPhoto(for: .normal)
        user.loadPhoto(for: .normal) { uiimage, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            if let uiimage = uiimage {
                self.photo = Image(uiImage: uiimage)
            }
        }
    }
}
