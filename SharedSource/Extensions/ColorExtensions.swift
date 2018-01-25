//
//  ColorExtensions.swift
//  CoderPlayground
//
//  Created by Kevin Mullins on 9/26/17.
//  Copyright © 2017 Appracatappra, LLC. All rights reserved.
//

import Foundation
import UIKit

/**
 Extends `UIColor` to support the Action Data controls and adds convenience methods for working with colors in a `Codable`, `Encodable` or `Decodable` class.
 
 ## iOS, tvOS and watchOS Examples:
 
 ```swift
 // Assign a color from a string
 let color: UIColor ~= "#FF0000"
 
 // Initialize a color from a hex string
 let green = UIColor(fromHex: "00FF00")
 
 // Convert color to a hex string
 let white = UIColor.white.toHex()
 ```
 */
extension UIColor {
    
    // MARK: - Custom Operators
    /**
     Sets a `UIColor` from a hex string in the format `rrggbb` or `rrggbbaa` where:
     
     * `rr` - Specifies the red component as a hex value in the range 00 to FF.
     * `gg` - Specifies the green component as a hex value in the range 00 to FF.
     * `bb` - Specifies the blue component as a hex value in the range 00 to FF.
     * `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
     
     The hex string can optionally start with the prefix of `#`.
     
     ## Examples:
     ```swift
     // Assign a color from a string in iOS, tvOS or watchOS
     let color: UIColor ~= "#FF0000"
     ```
     */
    public static func ~= ( left: inout UIColor, right: String) {
        left = right.uiColor!
    }
    
    // MARK: - Initializers
    /**
     Initializes a `UIColor` from a hex string in the format `rrggbb` or `rrggbbaa` where:
     
     * `rr` - Specifies the red component as a hex value in the range 00 to FF.
     * `gg` - Specifies the green component as a hex value in the range 00 to FF.
     * `bb` - Specifies the blue component as a hex value in the range 00 to FF.
     * `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
     
     The hex string can optionally start with the prefix of `#`.
     
     ## Examples:
     ```swift
     // Assign a color from a string in iOS, tvOS or watchOS
     let color = UIColor(fromHex: "#FF0000")
     ```
     
     - Parameter hex: The hex value to convert to a `UIColor`.
     */
    public convenience init?(fromHex hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt32 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let length = hexSanitized.count
        
        guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return nil }
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
            
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
            
        } else {
            return nil
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    // MARK: - Public Functions
    /**
     Converts a `UIColor` to a hex string in the format `rrggbb` or `rrggbbaa` where:
     
     * `rr` - Specifies the red component as a hex value in the range 00 to FF.
     * `gg` - Specifies the green component as a hex value in the range 00 to FF.
     * `bb` - Specifies the blue component as a hex value in the range 00 to FF.
     * `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
     
     The hex string can optionally start with the prefix of `#`.
     
     ## Examples:
     ```swift
     // Assign a color from a string in iOS, tvOS or watchOS
     let colorHex = UIColor.red.toHex();
     let colorHexShort = UIColor.red.toHex(withPrefix: false, includeAlpha: false);
     ```
     
     - Parameters:
     - hash: If `true`, the string will be prefixed with the `#` character.
     - alpha: If `true`, the string will include the alpha information.
     - Returns: The `UIColor` represented as a hex string.
     */
    public func toHex(withPrefix hash: Bool = true, includeAlpha alpha: Bool = true) -> String {
        let prefix = hash ? "#" : ""
        
        guard let components = cgColor.components, components.count >= 3 else {
            // Default to white
            return prefix + "FFFFFF"
        }
        
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        if components.count >= 4 {
            a = Float(components[3])
        }
        
        if alpha {
            return prefix + String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return prefix + String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}
