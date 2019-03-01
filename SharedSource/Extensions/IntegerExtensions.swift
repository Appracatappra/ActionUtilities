//
//  IntegerExtensions.swift
//  ActionUtilities iOS
//
//  Created by Kevin Mullins on 2/26/19.
//

import Foundation

/// Adds several useful features to Integers.
public extension Int {
    
    /**
     Returns the Int as a string formatted with the given pattern.
     
     - Parameter formatString: The pattern to format the Int into. The default pattern is `#,##0.##`.
     - Returns: The Int as a string in the given format.
    */
    public func formatted(as formatString:String = "#,##0.##") -> String {
        let formatter = NumberFormatter()
        formatter.positiveFormat = formatString
        formatter.negativeFormat = formatString
        
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    
}