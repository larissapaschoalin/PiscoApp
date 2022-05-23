//
//  AbubleApp.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 17/05/22.
//

import SwiftUI
import GameKit
import Firebase

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
    
    init() {
        FirebaseApp.configure()
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
