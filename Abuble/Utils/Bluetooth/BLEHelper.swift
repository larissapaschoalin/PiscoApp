//
//  BLEHelper.swift
//  Mini-Tangivel
//
//  Created by Marco Zulian on 20/05/22.
//

import SwiftUI

func getStripeColorArray(for matrix: Matrix) -> [UInt8] {
    var stripeArray: [UInt8] = Array(repeating: 0, count: 64 * 3)
    
    for cell in matrix.cells {
        let index = cell.col % 2 == 0 ? cell.col * 8 + cell.row : cell.col * 8 + (7 - cell.row)
        let components = UIColor(cell.color).rgba
        stripeArray[index * 3] = UInt8(components.red * 255)
        stripeArray[index * 3 + 1] = UInt8(components.green * 255)
        stripeArray[index * 3 + 2] = UInt8(components.blue * 255)
    }
    
    print(stripeArray)
    return stripeArray
}

func getStripeIndex(row: Int, col: Int) -> Int {
    return row % 2 == 0 ? row * 8 + col : row * 8 + (7 - col)
}
