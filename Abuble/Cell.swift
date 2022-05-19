//
//  Cell.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 17/05/22.
//

import Foundation
import SwiftUI

class Cell: Identifiable, ObservableObject {
    var id = UUID()
    let initColor: Color
    @Published var color: Color
    var row: Int = 0
    var col: Int = 0
    
    init(initColor: Color) {
        self.initColor = initColor
        self.color = initColor
    }
    
    init(initColor: Color, row: Int, col: Int) {
        self.initColor = initColor
        self.color = initColor
        self.row = row
        self.col = col
    }
    
    func clean() {
        self.color = initColor
    }
    
    func change(color: Color) {
        self.color = color
    }
    
    static public func populate(size: Int = 8, color: Color = .black) -> [Cell] {
        var cells: [Cell] = []
        for row in 0..<size {
            for col in 0..<size {
                cells.append(Cell(initColor: color, row: row, col: col))
            }
        }
        
        return cells
    }
}
