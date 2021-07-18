//
//  CalcKeyboardButtonStyle.swift
//  HistoCalc
//
//  Created by Micheau Bastien on 18/07/2021.
//

import Foundation
import SwiftUI

struct CalcKeyboardButtonStyle: ButtonStyle {
    private let isEqualButton: Bool
    private var backgroundColor: Color
    private var textColor: Color
    
    init(isEqualButton: Bool = false, backgroundColor: Color = Color("backgroundTextKeyInput"), textColor: Color = Color("textKeyIput")) {
        self.isEqualButton = isEqualButton
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(
                    minWidth: 50,
                    maxWidth: 150,
                    minHeight: isEqualButton ? 100 : 40,
                    maxHeight: isEqualButton ? 100 : 40,
                    alignment: .center
                ).padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .foregroundColor(textColor)
                .background(backgroundColor)
                .cornerRadius(10)
                .shadow(radius: 1)
                .opacity(configuration.isPressed ? 0.8 : 1)
    }
}
