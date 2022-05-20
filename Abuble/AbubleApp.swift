//
//  AbubleApp.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 17/05/22.
//

import SwiftUI
import GameKit

@main
struct AbubleApp: App {
    @StateObject var user = User()
    
    func authenticateUser() {
        let localPlayer = GKLocalPlayer.local
        localPlayer.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            user.from(gameCenter: localPlayer)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user)
                .onAppear {
                    authenticateUser()
                }
        }
    }
}
