//
//  StringExtensions.swift
//  CoderPlayground
//
//  Created by Kevin Mullins on 9/26/17.
//  Copyright © 2017 Appracatappra, LLC. All rights reserved.
//

import Foundation
import UIKit

/**
 Extends `String` to support the Action Data controls and adds convenience methods for working with `UIImage` and `UIColor` properties in a `Codable`, `Encodable` or `Decodable` class.
 */
extension String {
    
    // MARK: - Custom Operators
    /**
     Sets the `String` from the given `UIColor` where the color is converted to a hex string in the format `#rrggbbaa` where:
     
     * `rr` - Specifies the red component as a hex value in the range 00 to FF.
     * `gg` - Specifies the green component as a hex value in the range 00 to FF.
     * `bb` - Specifies the blue component as a hex value in the range 00 to FF.
     * `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
     
     */
    public static func ~= ( left: inout String, right: UIColor) {
        left = right.toHex()
    }
    
    /// Sets the `String` from the given `UIImage` where the image is converted to a PNG representation and Base 64 encoded.
    public static func ~= ( left: inout String, right: UIImage) {
        left = right.toString()
    }
    
    // MARK: - Public Functions
    /** Attempts to convert the `String` into a `UIColor` if it is in the format `rrggbb` or `rrggbbaa` where:
     
     * `rr` - Specifies the red component as a hex value in the range 00 to FF.
     * `gg` - Specifies the green component as a hex value in the range 00 to FF.
     * `bb` - Specifies the blue component as a hex value in the range 00 to FF.
     * `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
     
     The hex string can optionally start with the prefix of `#`. If the `String` cannot be converted to a `UIImage`, `nil` is returned.
    */
    public var uiColor: UIColor? {
        return UIColor(fromHex: self)
    }
    
    /// If the `String` contains a Base 64 encoded representation of an image it is returns as a `UIImage`, else `nil` is returned.
    public var uiImage: UIImage? {
        return UIImage(fromString: self)
    }
    
    // MARK: - Initializers
    /**
     Initializes a `String` instance from a given `UIColor` stored in the format `#rrggbbaa` where:
     
     * `rr` - Specifies the red component as a hex value in the range 00 to FF.
     * `gg` - Specifies the green component as a hex value in the range 00 to FF.
     * `bb` - Specifies the blue component as a hex value in the range 00 to FF.
     * `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
     
     - Parameter color: The given `UIColor` to convert to a hex string.
     */
    public init(fromColor color: UIColor) {
        self = color.toHex()
    }
    
    /**
     Initializes a `String` instance from a given `UIImage` where the image is converted to a PNG representation and Base 64 encoded.
     */
    public init(fromImage image: UIImage) {
        self = image.toString()
    }
    
    /**
     Returns a pretty-printed type name (minus the module name) for the given value.
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
     
     - Parameters:
         - width: The pixel width to constrain the string to.
         - font: The font that the string will be drawn in.
     
     - Returns: The height of the string drawn in the given font constrained to the given width.
    */
    public func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    /**
     Returns the draw width of the string in the given font constrained to the given height.
     
     - Parameters:
         - height: The pixel height to constrain the string to.
         - font: The font that the string will be drawn in.
     
     - Returns: The width of the string drawn in the given font constrained to the given height.
     */
    public func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    /**
     Returns the drawing bounds of the string in the given font constrained to the given maximum bounds.
     
     - Parameters:
     - size: The maximum pixel width and height on the string.
     - font: The font that the string will be drawn in.
     
     - Returns: The bounds on the string drawn in the given font constrained to the given maximum bounds.
    */
    public func bounds(withConstrainedSize size: CGSize, font: UIFont) -> CGSize {
        let boundingBox = self.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return CGSize(width: boundingBox.width, height: boundingBox.height)
    }
}
