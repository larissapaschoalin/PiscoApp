//
//  SquareButton.swift
//  Abuble
//
//  Created by Marco Zulian on 20/05/22.
//

import Foundation
import SwiftUI

struct SquareButton<Content: View>: View {
    
    @Binding var isEnabled: Bool
    let action: () -> Void
    @ViewBuilder let content: Content
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Image(isEnabled ? "Button" : "DisabledButton")
                content
            }
        }.disabled(!isEnabled)
    }
}
