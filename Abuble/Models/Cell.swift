//
//  Cell.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 17/05/22.
//

import Foundation
import SwiftUI

class Cell: Identifiable, ObservableObject {
    let id: String
    @Published var color: Color
    var row: Int = 0
    var col: Int = 0
    
    init(color: Color = .black) {
        self.id = UUID().uuidString
        self.color = color
    }
    
    init(color: Color = .black, row: Int, col: Int) {
        self.id = UUID().uuidString
        self.color = color
        self.row = row
        self.col = col
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        color = try container.decode(Color.self, forKey: .color)
        row = try container.decode(Int.self, forKey: .row)
        col = try container.decode(Int.self, forKey: .col)
    }
    
    func clean() {
        self.color = .black
    }
    
    func change(color: Color) {
        self.color = color
    }
    
    static public func populate(size: Int = 8, color: Color = .black) -> [Cell] {
        var cells: [Cell] = []
        for row in 0..<size {
            for col in 0..<size {
                cells.append(Cell(row: row, col: col))
            }
        }
        
        return cells
    }
}

extension Cell: Codable {
    private enum CodingKeys: CodingKey {
        case id, color, row, col
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(color, forKey: .color)
        try container.encode(row, forKey: .row)
        try container.encode(col, forKey: .col)
    }
}
