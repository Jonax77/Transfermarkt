//
//  StringUtil.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/19/24.
//

import Foundation

extension String {
    func transformMarketValue() -> Int {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "€"
        
        var scaledValue: Int = 1
        var stringValue = self
        
        if let lastChar = self.last, lastChar.isLetter {
            if lastChar == "m" {
                scaledValue = 1_000_000
            } else if lastChar == "k" {
                scaledValue = 1_000
            }
            
            // Remove the last character (either 'm' or 'k')
            stringValue.removeLast()
        }
        
        if let intValue = Int(stringValue) {
            let transformedValue = intValue * scaledValue
            return transformedValue
        }
        
        return 0
    }
}
