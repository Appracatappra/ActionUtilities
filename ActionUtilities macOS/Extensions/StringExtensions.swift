//
//  StringExtensions.swift
//  ActionUtilities.macOS
//
//  Created by Kevin Mullins on 1/18/18.
//  Copyright © 2018 Appracatappra, LLC. All rights reserved.
//

import Foundation
import AppKit

/**
 Extends `String` to support the Action Data controls and adds convenience methods for working with `NSImage` and `NSColor` properties in a `Codable`, `Encodable` or `Decodable` class.
 
 ## Examples:
 ```swift
 // Get the hex representation of a color in macOS.
 let hex: String ~= NSColor.white
 ```
 */
extension String {
    
    // MARK: - Custom Operators
    /**
     Sets the `String` from the given `NSColor` where the color is converted to a hex string in the format `#rrggbbaa` where:
     
     * `rr` - Specifies the red component as a hex value in the range 00 to FF.
     * `gg` - Specifies the green component as a hex value in the range 00 to FF.
     * `bb` - Specifies the blue component as a hex value in the range 00 to FF.
     * `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
     
     ## Examples:
     ```swift
     // Get the hex representation of a color in macOS.
     let hex: String ~= NSColor.white
     ```
     
     */
    public static func ~= ( left: inout String, right: NSColor) {
        left = right.toHex()
    }
    
    /**
     Sets the `String` from the given `NSImage` where the image is converted to a PNG representation and Base 64 encoded.
     
     ## Examples:
     ```swift
     // Get the Base 64 representation of an image in macOS.
     let hex: String ~= NSImage(named: "Background.png")
     ```
    */
    public static func ~= ( left: inout String, right: NSImage) {
        left = right.toString()
    }
    
    // MARK: - Public Functions
    /** Attempts to convert the `String` into a `NSColor` if it is in the format `rrggbb` or `rrggbbaa` where:
     
     * `rr` - Specifies the red component as a hex value in the range 00 to FF.
     * `gg` - Specifies the green component as a hex value in the range 00 to FF.
     * `bb` - Specifies the blue component as a hex value in the range 00 to FF.
     * `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
     
     ## Examples:
     ```swift
     // Get the hex representation of a color in macOS.
     let hex: String ~= NSColor.white
     let color = hex.nsColor
     ```
     
     The hex string can optionally start with the prefix of `#`. If the `String` cannot be converted to a `NSImage`, `nil` is returned.
     */
    public var nsColor: NSColor? {
        return NSColor(fromHex: self)
    }
    
    /**
     If the `String` contains a Base 64 encoded representation of an image it is returns as a `NSImage`, else `nil` is returned.
     
     ## Examples:
     ```swift
     // Get the Base 64 representation of an macOS.
     let hex: String ~= NSImage(named: "Background.png")
     let image = hex.nsImage
     ```
     */
    public var nsImage: NSImage? {
        return NSImage(fromString: self)
    }
    
    // MARK: - Initializers
    /**
     Initializes a `String` instance from a given `NSColor` stored in the format `#rrggbbaa` where:
     
     * `rr` - Specifies the red component as a hex value in the range 00 to FF.
     * `gg` - Specifies the green component as a hex value in the range 00 to FF.
     * `bb` - Specifies the blue component as a hex value in the range 00 to FF.
     * `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
     
     ## Examples:
     ```swift
     // Get the hex representation of a color in macOS.
     let hex = String(fromColor: NSColor.white)
     ```
     
     - Parameter color: The given `NSColor` to convert to a hex string.
     */
    public init(fromColor color: NSColor) {
        self = color.toHex()
    }
    
    /**
     Initializes a `String` instance from a given `NSImage` where the image is converted to a PNG representation and Base 64 encoded.
     
     ## Examples:
     ```swift
     // Get the Base 64 representation of an image in macOS.
     let hex = String(fromImage: NSImage(named: "Background.png"))
     ```
     */
    public init(fromImage image: NSImage) {
        self = image.toString()
    }
    
    /**
     Returns a pretty-printed type name (minus the module name) for the given value.
     
     ## Example:
     ```swift
     // Assings a pretty type name
     let name = String.typeName(of: "<module>")
     ```
     
     - Parameter value: The value to get the type name of.
     - Returns: The type name minus the module name.
     */
    public static func typeName(of value: Any) -> String {
        // Use a mirror to get the type name
        let mirror = Mirror(reflecting: value)
        var name = "\(mirror.subjectType)"
        
        // Clean up dictionary names
        name = name.replacingOccurrences(of: "<", with: "(")
        name = name.replacingOccurrences(of: ">", with: ")")
        
        // Remove the module name if included
        if name.contains(".") {
            let parts = name.components(separatedBy: ".")
            return parts[parts.count-1]
        } else {
            return name
        }
    }
    
    /**
     Returns the draw height of the string in the given font constrained to the given width.
     
     ## Example:
     ```swift
     // Get a string height in macOS
     let font = NSFont.systemFont(ofSize: 34, weight: NSFontWeightThin)
     let text = "Hello World"
     let height = text.height(withConstrainedWidth: 250, font: font)
     ```
     
     - Parameters:
     - width: The pixel width to constrain the string to.
     - font: The font that the string will be drawn in.
     
     - Returns: The height of the string drawn in the given font constrained to the given width.
     */
    public func height(withConstrainedWidth width: CGFloat, font: NSFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    /**
     Returns the draw width of the string in the given font constrained to the given height.
     
     ## Example:
     ```swift
     // Get a string height in macOS
     let font = NSFont.systemFont(ofSize: 34, weight: NSFontWeightThin)
     let text = "Hello World"
     let height = text.width(withConstrainedHeight: 50, font: font)
     ```
     
     - Parameters:
     - height: The pixel height to constrain the string to.
     - font: The font that the string will be drawn in.
     
     - Returns: The width of the string drawn in the given font constrained to the given height.
     */
    public func width(withConstrainedHeight height: CGFloat, font: NSFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    /**
     Returns the drawing bounds of the string in the given font constrained to the given maximum bounds.
     
     ## Example:
     ```swift
     // Get a string height in iOS, tvOS and watchOS
     let font = NSFont.systemFont(ofSize: 34, weight: NSFontWeightThin)
     let text = "Hello World"
     let bounds = text.bounds(withConstrainedSize: GGSize(width: 250, height: 50), font: font)
     ```
     
     - Parameters:
     - size: The maximum pixel width and height on the string.
     - font: The font that the string will be drawn in.
     
     - Returns: The bounds on the string drawn in the given font constrained to the given maximum bounds.
     */
    public func bounds(withConstrainedSize size: CGSize, font: NSFont) -> CGSize {
        let boundingBox = self.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return CGSize(width: boundingBox.width, height: boundingBox.height)
    }
}
