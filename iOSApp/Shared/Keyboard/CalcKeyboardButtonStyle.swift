//
//  CalcKeyboardButtonStyle.swift
//  HistoCalc
//
//  Created by Micheau Bastien on 18/07/2021.
//

import Foundation
import SwiftUI

struct CalcKeyboardButtonStyle: ButtonStyle {
    private let isEqualButton: Bool!
    private let background: Color
    private let textColor = Color("textKeyIput")
    private let keyHeight: CGFloat = 40
    private let cornerRadius: CGFloat = 10
    private let shadowRadius: CGFloat = 4
    
    init(isEqualButton: Bool = false, backgroundColor: Color = Color("backgroundTextKeyInput")) {
        self.isEqualButton = isEqualButton
        self.background = backgroundColor
        
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(
                    minWidth: 50,
                    maxWidth: 150,
                    minHeight: isEqualButton ? keyHeight * 2 : keyHeight,
                    maxHeight: isEqualButton ? keyHeight * 2 : keyHeight,
                    alignment: .center
                ).padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .foregroundColor(textColor)
                .background(background)
                .cornerRadius(cornerRadius)
                .shadow(radius: configuration.isPressed ? 1 : shadowRadius)
                .opacity(configuration.isPressed ? 0.8 : 1)
    }
}
