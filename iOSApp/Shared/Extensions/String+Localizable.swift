//
//  String+Localizable.swift
//  CalculSmart
//
//  Created by Micheau Bastien on 18/07/2021.
//

import Foundation

protocol Localizable {
    var localized: String { get }
}

extension String: Localizable {    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
