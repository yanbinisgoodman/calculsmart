//
//  ContentView.swift
//  Shared
//
//  Created by Micheau Bastien on 18/07/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var viewModel = CalculSmartViewModel.shared
    
    var body: some View {
        VStack {
            Spacer()
            ScrollView {
                ForEach(viewModel.histoLines, id: \.id) { histoLine in
                    HistoLineView(line: histoLine)
                        .rotationEffect(.degrees(180))
                }
            }.rotationEffect(.degrees(180))
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.histoLines.filter({ line in
                        return line.type == .history && line.id < viewModel.histoLines[viewModel.currentLineIndex].id
                    }), id: \.id) { line in
                        Button("\("result".localized)\(line.id)") {
                            viewModel.handleKeyboardEvent(input: .variable(line.id))
                        }.buttonStyle(ResultButtonStyle())
                    }
                }.padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 5)
            }
            KeyboardView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
