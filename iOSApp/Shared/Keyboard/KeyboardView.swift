//
//  KeyboardView.swift
//  HistoCalc (iOS)
//
//  Created by Micheau Bastien on 17/07/2021.
//

import SwiftUI

struct KeyboardView: View {
    private let lineSpacing: CGFloat = 15
    
    var body: some View {
        VStack (spacing: lineSpacing) {
            HStack {
                Button("AC") {
                    CalculSmartViewModel.shared.handleKeyboardEvent(input: .AC)
                }.buttonStyle(CalcKeyboardButtonStyle())
                Button("%") {
                    CalculSmartViewModel.shared.handleKeyboardEvent(input: .modulo)
                }.buttonStyle(CalcKeyboardButtonStyle())
                Button("/") {
                    CalculSmartViewModel.shared.handleKeyboardEvent(input: .divide)
                }.buttonStyle(CalcKeyboardButtonStyle())
                Button("x") {
                    CalculSmartViewModel.shared.handleKeyboardEvent(input: .multiply)
                }.buttonStyle(CalcKeyboardButtonStyle())
            }
            HStack {
                Button("7") {
                    CalculSmartViewModel.shared.handleKeyboardEvent(input: .number(7))
                }.buttonStyle(CalcKeyboardButtonStyle())
                Button("8") {
                    CalculSmartViewModel.shared.handleKeyboardEvent(input: .number(8))

                }.buttonStyle(CalcKeyboardButtonStyle())
                Button("9") {
                    CalculSmartViewModel.shared.handleKeyboardEvent(input: .number(9))
                }.buttonStyle(CalcKeyboardButtonStyle())
                Button("-") {
                    CalculSmartViewModel.shared.handleKeyboardEvent(input: .minus)
                }.buttonStyle(CalcKeyboardButtonStyle())
            }
            HStack {
                Button("4") {
                    CalculSmartViewModel.shared.handleKeyboardEvent(input: .number(4))
                }.buttonStyle(CalcKeyboardButtonStyle())
                Button("5") {
                    CalculSmartViewModel.shared.handleKeyboardEvent(input: .number(5))
                }.buttonStyle(CalcKeyboardButtonStyle())
                Button("6") {
                    CalculSmartViewModel.shared.handleKeyboardEvent(input: .number(6))
                }.buttonStyle(CalcKeyboardButtonStyle())
                Button("+") {
                    CalculSmartViewModel.shared.handleKeyboardEvent(input: .add)
                }.buttonStyle(CalcKeyboardButtonStyle())
            }
            HStack {
                VStack (spacing: lineSpacing) {
                    Button("1") {
                        CalculSmartViewModel.shared.handleKeyboardEvent(input: .number(1))
                    }.buttonStyle(CalcKeyboardButtonStyle())
                    Button(action: {
                        CalculSmartViewModel.shared.handleKeyboardEvent(input: .backspace)
                    }, label: {
                        Image(systemName: "delete.left")
                    }).buttonStyle(CalcKeyboardButtonStyle())
                }
                VStack (spacing: lineSpacing) {
                    Button("2") {
                        CalculSmartViewModel.shared.handleKeyboardEvent(input: .number(2))
                    }.buttonStyle(CalcKeyboardButtonStyle())
                    Button("0") {
                        CalculSmartViewModel.shared.handleKeyboardEvent(input: .number(0))
                    }.buttonStyle(CalcKeyboardButtonStyle())
                }
                VStack (spacing: lineSpacing) {
                    Button("3") {
                        CalculSmartViewModel.shared.handleKeyboardEvent(input: .number(3))
                    }.buttonStyle(CalcKeyboardButtonStyle())

                    Button(",") {
                        CalculSmartViewModel.shared.handleKeyboardEvent(input: .coma)
                    }.buttonStyle(CalcKeyboardButtonStyle())
                }
                EnterKeyView()
            }
        }
        .padding()
        
    }
    
    struct KeyboardView_Previews: PreviewProvider {
        static var previews: some View {
            KeyboardView()
        }
    }
}
