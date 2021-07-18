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
    private let textColor = Color("textKeyIput")
    private let keyHeight: CGFloat = 30
    private let cornerRadius: CGFloat = 10
    private let shadowRadius: CGFloat = 4
    
    init(backgroundColor: Color = Color("backgroundTextKeyInput")) {
        self.background = backgroundColor
        
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(
                    minWidth: 75,
                    maxWidth: .infinity,
                    minHeight: keyHeight,
                    maxHeight: keyHeight,
                    alignment: .center
                ).padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .foregroundColor(textColor)
                .background(background)
                .cornerRadius(500)
                .shadow(radius: configuration.isPressed ? 1 : shadowRadius)
                .opacity(configuration.isPressed ? 0.8 : 1)
    }
}
