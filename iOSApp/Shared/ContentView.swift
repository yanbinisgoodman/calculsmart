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
            ResultListView()
            KeyboardView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
