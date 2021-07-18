//
//  HistoLineView.swift
//  HistoCalc
//
//  Created by Micheau Bastien on 17/07/2021.
//

import SwiftUI

enum HistoLineType {
    case history
    case current
}

struct HistoLineView: View {
    let line: HistoLine
    
    private func format(number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 10
        return numberFormatter.string(from: NSNumber(value: number)) ?? ""
    }
    
    var body: some View {
        HStack {
            Spacer()
            switch line.type {
            case .history:
                Text("\("result".localized)\(line.id)")
                    .foregroundColor(.gray)
                    .padding(.horizontal, 0)
                Text(" = ")
                    .foregroundColor(.gray)
                    .padding(.horizontal, 0)
                Text(line.text == "" ? "0" : line.text)
                    .foregroundColor(.gray)
                if let value = line.value {
                    Text(" = ")
                        .foregroundColor(.gray)
                        .padding(.horizontal, 0)
                    Text("\(format(number: value))")
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                }
            case .current:
                Text(line.text == "" ? "0" : line.text)
                    .font(.largeTitle)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                if let value = line.value {
                    Text(" = ")
                        .font(.largeTitle)
                        .padding(.vertical, 4)
                    Text("\(format(number: value))")
                        .font(.largeTitle)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                }
            }
        }.padding(.vertical, 4)
        .onTapGesture {
            CalculSmartViewModel.shared.switchCurrentLine(toLineWithId: self.line.id)
        }
    }
}

struct HistoLineView_Previews: PreviewProvider {
    static var previews: some View {
        HistoLineView(line: HistoLine(text: "2+2", type: .current))
        HistoLineView(line: HistoLine(text: "1+2", type: .history))
    }
}
