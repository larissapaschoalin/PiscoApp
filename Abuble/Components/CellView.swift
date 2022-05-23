//
//  PaintView.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 17/05/22.
//

import SwiftUI

struct CellView: View {
    @StateObject var cell: Cell
//    var selectedColor: Binding<Color>?
    var selectedColor: Binding<Color>? = nil
    var size: CGFloat = 40
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(cell.color)
                .frame(width: size, height: size)
                .onTapGesture {
                    if let newColor = selectedColor {
                        cell.change(color: newColor.wrappedValue)
                    }
                }
        }
    }
}



struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cell: Cell(initColor: .black))
    }
}
