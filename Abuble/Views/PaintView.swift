//
//  PaintView.swift
//  Abuble
//
//  Created by Larissa Paschoalin on 18/05/22.
//

import SwiftUI

struct PaintView: View {
    @State var selectedColor: Color = Color("YellowColor")
    
    let matrix: Matrix = Matrix(cells: Cell.populate())
    
    @State var colors: [Color] = [
        Color("RedColor"),
        Color("YellowColor"),
        Color("GreenColor"),
        Color(.white),
        Color("BlueColor"),
        Color("PurpleColor"),
        Color("PinkColor"),
        Color(.black)
    ]
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    
    var body: some View {
        VStack(spacing: 25) {
            
            
            VStack(spacing: 10) {
                Text("personalize seu")
                //.font(.title)
                    .font(Font.custom("Montserrat-Regular", size: 24))
                
                Text("PISCO")
                    .font(Font.custom("PressStart2P-Regular", size: 40))
                
            }
            
            
            MatrixView(matrix: matrix, selectedColor: $selectedColor)
            
            HStack {
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(colors, id: \.self) { color in
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(color)
                            .frame(width: 50, height: 50)
                            .onTapGesture {
                                selectedColor = color
                            }
                        
                    }
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                ColorPicker("Selecione uma cor:", selection: $selectedColor, supportsOpacity: false)
                    .scaleEffect(CGSize(width: 3, height: 3))
                    .padding(40)
                    .labelsHidden()
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            
            HStack(spacing: 20) {
                Button {
                    matrix.cleanMatrix()
                } label: {
                    ZStack {
                        Image("Button")
                            .resizable()
                            .frame(width: 160, height: 60)
                        
                        
                        Text("Clean")
                            .font(Font.custom("PressStart2P-Regular", size: 20))
                            .foregroundColor(Color(.black))
                            .textCase(.uppercase)
                            .padding(.trailing,4)
                        
                    }
                }
                
                Button {
                    print("salvar")
                } label: {
                    ZStack {
                        Image("Button")
                            .resizable()
                            .frame(width: 160, height: 60)
                        
                        
                        Text("Save")
                            .font(Font.custom("PressStart2P-Regular", size: 20))
                            .foregroundColor(Color(.black))
                            .textCase(.uppercase)
                            .padding(.trailing,4)
                        
                    }
                }
            }
            .padding()
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
