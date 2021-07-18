//
//  ResultButtonStyle.swift
//  HistoCalc
//
//  Created by Micheau Bastien on 18/07/2021.
//

import Foundation
import SwiftUI

struct ResultButtonStyle: ButtonStyle {
    private let background: Color
    private let textColor: Color
    
    init(backgroundColor: Color = Color("backgroundTextKeyInput"), textColor: Color = Color("textKeyIput")) {
        self.background = backgroundColor
        self.textColor = textColor
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(
                    minWidth: 75,
                    maxWidth: .infinity,
                    minHeight: 30,
                    maxHeight: 30,
                    alignment: .center
                ).padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .foregroundColor(textColor)
                .background(background)
                .cornerRadius(500)
                .shadow(radius: 1)
                .opacity(configuration.isPressed ? 0.8 : 1)
    }
}
