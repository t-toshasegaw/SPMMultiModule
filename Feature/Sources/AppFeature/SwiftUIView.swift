//
//  ContentView.swift
//  SPMMultiModule
//
//  Created by 長谷川稔樹 on 2023/05/23.
//

import SwiftUI
import Charts
import ComplexModule

public struct SwiftUIView: View {
    @State var inputReal = 1
    @State var inputImaginary = 1
    @State var complexNums: [Complex<Double>] = []
    
    public init() {}
    
    public var body: some View {
        VStack {
            HStack {
                TextField(
                    "num1",
                    value: $inputReal,
                    format: .number
                )
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(4)
                
                Text("x")
                    .padding()
                
                Text("+")
                    .padding()
                
                TextField(
                    "num2",
                    value: $inputImaginary,
                    format: .number
                )
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(4)
                
                Text("yi")
            }
            
            Button {
                complexNums = (0..<11).map {
                    Complex<Double>(
                        Double(inputReal) * Double($0), Double(inputImaginary) * Double($0)
                    )
                }
            } label: {
                Text("グラフ生成").font(.headline)
            }
            .padding()
            .background(Color(.systemGray))
            .foregroundColor(Color(.white))
            .cornerRadius(4)
            
            GroupBox("( 0 < x < 11, 0 < y < 11)") {
                Chart {
                    ForEach(complexNums, id: \.self) { complexNum in
                        LineMark(
                            x: .value("real", complexNum.real),
                            y: .value("imaginary", complexNum.imaginary)
                        )
                    }
                }
                .background(Color(.white))
                .cornerRadius(4)
            }
        }
        .padding()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
