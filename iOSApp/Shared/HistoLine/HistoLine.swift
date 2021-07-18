//
//  HistoLine.swift
//  CalculSmart
//
//  Created by Micheau Bastien on 18/07/2021.
//

import Foundation
import Expression

struct HistoLine {
    static var maxId = 0
    
    let id: Int
    var text: String
    var type: HistoLineType
    var value: Double? {
        get {
            var evaluatedText = self.text
            do {
                let regex = try NSRegularExpression(pattern: "r[0-9]+", options: .caseInsensitive)
                let matches = regex.matches(in: self.text, range: NSRange(self.text.startIndex..., in: self.text))
                matches.forEach { result in
                    guard let idVar = Int(String(text[Range(result.range, in: text)!]).dropFirst(1)) else {
                        return
                    }
                    let line = CalculSmartViewModel.shared.histoLines.first { line in
                        line.id == idVar
                    }
                    evaluatedText = evaluatedText.replacingOccurrences(of: "[\(String(text[Range(result.range, in: text)!]))]", with: "\(line?.value ?? 0)")
                }
            } catch(let error) {
                print(error.localizedDescription)
            }
            let exp: Expression = Expression(evaluatedText)
            let value = try? exp.evaluate() as Double
            return value
        }
    }
    /// UpdatedToggle is only here to ask manual refresh of the Histoline in view
    var updatedToggle = false
    
    init(text: String = "", type: HistoLineType) {
        HistoLine.maxId += 1
        self.id = HistoLine.maxId
        self.text = text
        self.type = type
    }
}
