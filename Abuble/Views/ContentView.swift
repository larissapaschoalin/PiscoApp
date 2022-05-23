//
//  ContentView.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 17/05/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        NavigationView {
            HomeView(coordinator: Coordinator(user: user))
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
