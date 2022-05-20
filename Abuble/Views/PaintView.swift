//
//  PaintView.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 18/05/22.
//

import SwiftUI

struct PaintView: View {
    @State var selectedColor: Color = .gray
    let matrix: Matrix = Matrix(cells: Cell.populate())
    
    var body: some View {
        VStack(spacing: 25) {
            
            Spacer()
            
            VStack(spacing: 10) {
                Text("personalize seu")
                    //.font(.title)
                    .font(Font.custom("Montserrat-Regular", size: 24))
                
                Text("PISCO")
                    .font(Font.custom("PressStart2P-Regular", size: 40))
                
            }
            
            
            MatrixView(matrix: matrix, selectedColor: $selectedColor)
            
            ColorPicker("Selecione uma cor:", selection: $selectedColor, supportsOpacity: false)
                .labelsHidden()
     
            
            Button {
                matrix.cleanMatrix()
            } label: {
                Text("Limpar")
                    .font(Font.custom("PressStart2P-Regular", size: 30))
                    .foregroundColor(.black)
                    .textCase(.uppercase)
            }

            Button {
                print("salvo")
            } label: {
                Text("Salvar")
                    .font(Font.custom("PressStart2P-Regular", size: 30))
                    .foregroundColor(.black)
                    .textCase(.uppercase)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .background(Color("BackgroundColor").ignoresSafeArea())
        
    }
}

struct PaintView_Previews: PreviewProvider {
    static var previews: some View {
        PaintView()
    }
}
