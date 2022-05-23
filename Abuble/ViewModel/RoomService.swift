//
//  RoomViewModel.swift
//  Mini-Tangivel
//
//  Created by Marco Zulian on 19/05/22.
//

import Foundation
import Combine
import SwiftUI

final class RoomService: ObservableObject {

    static var shared = RoomService()
    
    @Published private var room: GameRoom?
    @Published var isInsideRoom: Bool = false
    private var cancellables: Set<AnyCancellable> = []
    var code: String { room?.code ?? "Fail" }
    
}
