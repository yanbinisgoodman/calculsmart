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

struct HistoLineButtonStyle: ButtonStyle {
    private let background: Color
    private let textColor: Color
    
    init(backgroundColor: Color = Color("backgroundTextKeyInput"), textColor: Color = Color("textKeyIput")) {
        self.background = backgroundColor
        self.textColor = textColor
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .opacity(configuration.isPressed ? 0.8 : 1)
    }
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
        Button(action: {
            CalculSmartViewModel.shared.switchCurrentLine(toLineWithId: self.line.id)
        }, label: {
            HStack {
                Spacer()
                switch line.type {
                case .history:
                    if line.text != "" {
                        Text("\("result".localized)\(line.id)")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 0)
                        Text(" = ")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 0)
                        Text(line.text)
                            .font(.headline)
                            .foregroundColor(.gray)
                        if let value = line.value {
                            Text(" = ")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 0)
                            Text("\(format(number: value))")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .padding(.trailing, 10)
                        }
                    } else {
                        Text("0")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 10)
                    }
                case .current:
                    HStack (spacing: 0) {
                        Text("\("result".localized)\(line.id)")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.vertical, 4)
                        Text(" = ")
                            .foregroundColor(.gray)
                        Text(line.text == "" ? "0" : line.text)
                            .font(.largeTitle)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                        Text(" = ")
                            .padding(.vertical, 4)
                            .foregroundColor(.gray)
                        Text(line.value != nil ? "\(format(number: line.value!))" : (line.text == "" ? "0" : "ERR"))
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                            .padding(.vertical, 4)
                    }
                }
            }.padding(.vertical, 4)
        }).buttonStyle(HistoLineButtonStyle())
    }
}

struct HistoLineView_Previews: PreviewProvider {
    static var previews: some View {
        HistoLineView(line: HistoLine(text: "", type: .current))
        HistoLineView(line: HistoLine(text: "", type: .history))
    }
}
