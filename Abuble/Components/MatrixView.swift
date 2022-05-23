//
//  Matrix.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 17/05/22.
//

import SwiftUI

struct MatrixView: View {
    var matrix: Matrix = Matrix()
    var selectedColor: Binding<Color>? = nil
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(matrix.cells, id: \.id) { cell in
                    ZStack {
                        CellView(cell: cell, selectedColor: selectedColor)
                    }
                }
                Spacer()
            }
        }
    }
}

struct MatrixView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixView()
    }
}
