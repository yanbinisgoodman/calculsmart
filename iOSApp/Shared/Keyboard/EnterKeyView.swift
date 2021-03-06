//
//  EnterKeyView.swift
//  HistoCalc
//
//  Created by Micheau Bastien on 18/07/2021.
//

import SwiftUI

struct EnterKeyView: View {
    @ObservedObject var viewModel = CalculSmartViewModel.shared

    var body: some View {
        if viewModel.histoLines[viewModel.currentLineIndex].value == nil {
            Button(action: {}, label: {
                Image(systemName: "equal")
            }).disabled(true)
            .buttonStyle(CalcKeyboardButtonStyle(isEqualButton: true, backgroundColor: Color("textKeyIput"), textColor: Color("backgroundTextKeyInput")))
            .opacity(0.6)
        } else {
            Button(action: {
                CalculSmartViewModel.shared.handleKeyboardEvent(input: .equal)
            }, label: {
                Image(systemName: "equal")
            }).buttonStyle(CalcKeyboardButtonStyle(isEqualButton: true))

        }
    }
}

struct EnterKeyView_Previews: PreviewProvider {
    static var previews: some View {
        EnterKeyView()
    }
}
