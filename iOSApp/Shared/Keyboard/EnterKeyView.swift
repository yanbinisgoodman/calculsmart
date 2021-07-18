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
        Button("=") {
            CalculSmartViewModel.shared.handleKeyboardEvent(input: .equal)
        }.disabled(viewModel.histoLines[viewModel.currentLineIndex].value == nil)
        .opacity(viewModel.histoLines[viewModel.currentLineIndex].value == nil ? 0.4 : 1)
        .buttonStyle(CalcKeyboardButtonStyle(isEqualButton: true))
    }
}

struct EnterKeyView_Previews: PreviewProvider {
    static var previews: some View {
        EnterKeyView()
    }
}
