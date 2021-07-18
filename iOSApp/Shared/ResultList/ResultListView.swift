//
//  ResultListView.swift
//  HistoCalc
//
//  Created by Micheau Bastien on 18/07/2021.
//

import SwiftUI

struct ResultListView: View {
    private let viewModel = CalculSmartViewModel.shared
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.histoLines.filter({ line in
                    return line.type == .history && line.id < viewModel.histoLines[viewModel.currentLineIndex].id
                }), id: \.id) { line in
                    Button("\("result".localized)\(line.id)") {
                        viewModel.handleKeyboardEvent(input: .variable(line.id))
                    }.buttonStyle(CalcKeyboardButtonStyle())
                }
            }.padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.vertical, 5)
        }
    }
}

struct ResultListView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView()
    }
}
