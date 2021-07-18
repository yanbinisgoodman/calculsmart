//
//  CalculSmartViewModel.swift
//  HistoCalc
//
//  Created by Micheau Bastien on 17/07/2021.
//

import Foundation
import Expression

class CalculSmartViewModel: ObservableObject {
    static let shared = CalculSmartViewModel()
    @Published var histoLines: [HistoLine] = []
    var currentLineIndex = 0
    
    private init() {
        histoLines.append(HistoLine(type: .current))
    }
    
    var previewValue: Double = 0
    
    func handleKeyboardEvent(input: KeyboardInput) {
        switch input {
        case .minus:
            self.histoLines[currentLineIndex].text += "-"
        case .add:
            self.histoLines[currentLineIndex].text += "+"
        case .AC:
            self.histoLines[currentLineIndex].text.removeAll()
        case .coma:
            self.histoLines[currentLineIndex].text += "."
        case .divide:
            self.histoLines[currentLineIndex].text += "/"
        case .modulo:
            self.histoLines[currentLineIndex].text += "%"
        case .multiply:
            self.histoLines[currentLineIndex].text += "*"
        case .number(let i):
            self.histoLines[currentLineIndex].text += String(i)
        case .equal:
            if self.currentLineIndex == 0 {
                let newLine = HistoLine(type: .current)
                self.histoLines.insert(newLine, at: 0)
                self.switchCurrentLine(toLineWithId: newLine.id)
            } else {
                self.switchCurrentLine(toLineWithId: self.histoLines[self.currentLineIndex - 1].id)
                // Here we refresh all lines because we are not last variable
                for i in self.histoLines.indices {
                    histoLines[i].updatedToggle.toggle()
                }
            }
        case .emoji:
            print("emoji")
        case .variable(let id):
            self.histoLines[currentLineIndex].text += "{\("result".localized)\(id)}"
        }
    }
    
    func switchCurrentLine(toLineWithId id: Int) {
        for i in self.histoLines.indices {
            if self.histoLines[i].type == .current { self.histoLines[i].type = .history}
        }
        let indexOfLineWithIdOptionnal = self.histoLines.firstIndex { line in
            return line.id == id
        }
        guard let indexOfLineWithId = indexOfLineWithIdOptionnal else { return }
        self.histoLines[indexOfLineWithId].type = .current
        self.currentLineIndex = indexOfLineWithId
    }
    
    private func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
