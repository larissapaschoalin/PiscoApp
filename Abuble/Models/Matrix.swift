//
//  Matrix.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 18/05/22.
//

import Foundation

class Matrix: Codable {
    var cells: [Cell] = []
    
    init() {}
    
    init(cells: [Cell]) {
        self.cells = cells
    }
    
    func cleanMatrix() {
        for cell in cells {
            cell.clean()
        }
    }
}
