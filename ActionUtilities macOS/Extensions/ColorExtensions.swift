//
//  ColorExtensions.swift
//  ActionUtilities.macOS
//
//  Created by Kevin Mullins on 1/18/18.
//  Copyright © 2018 Appracatappra, LLC. All rights reserved.
//

import Foundation
import AppKit

/**
 Extends `NSColor` to support the Action Data controls and adds convenience methods for working with colors in a `Codable`, `Encodable` or `Decodable` class.
 
 ## Examples:
 
 ```swift
 // Assign a color from a string
 let color: NSColor ~= "#FF0000"
 
 // Initialize a color from a hex string
 let green = NSColor(fromHex: "00FF00")
 
 // Convert color to a hex string
 let white = NSColor.white.toHex()
 ```
 */
extension NSColor {
    // MARK: - Custom Operators
    /**
     Sets a `NSColor` from a hex string in the format `rrggbb` or `rrggbbaa` where:
     
     * `rr` - Specifies the red component as a hex value in the range 00 to FF.
     * `gg` - Specifies the green component as a hex value in the range 00 to FF.
     * `bb` - Specifies the blue component as a hex value in the range 00 to FF.
     * `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
     
     The hex string can optionally start with the prefix of `#`.
     
     ## Examples:
     ```swift
     // Assign a color from a string in macOS
     let color: NSColor ~= "#FF0000"
     ```
     */
    public static func ~= ( left: inout NSColor, right: String) {
        left = right.nsColor!
    }
    
    // MARK: - Initializers
    /**
     Initializes a `NSColor` from a hex string in the format `rrggbb` or `rrggbbaa` where:
     
     * `rr` - Specifies the red component as a hex value in the range 00 to FF.
     * `gg` - Specifies the green component as a hex value in the range 00 to FF.
     * `bb` - Specifies the blue component as a hex value in the range 00 to FF.
     * `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
     
     The hex string can optionally start with the prefix of `#`.
     
     ## Examples:
     ```swift
     // Assign a color from a string in macOS
     let color = NSColor(fromHex: "#FF0000")
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
    
    /**
     Initializes a `NSColor` for the given grayscale percent and alph value.
     
     ## Example:
     ```swift
     let gray = NSColor(fromGrayScaleShade: 200)
     ```
     
     - Parameters:
         - shade: A number from 0 to 255 specifying the shade of gray to mix.
         - alphaPercent: A number from 0 to 100 specifying the opacity of the color.
     */
    public convenience init(fromGrayScaleShade shade:Int, withAlphaPercent alphaPercent: Int = 100) {
        let value = CGFloat(shade) / 255.0
        let alphaValue = CGFloat(alphaPercent) / 100.0
        self.init(red: value, green: value, blue: value, alpha: alphaValue)
    }
    
    /**
     Initializes a `NSColor` from the given red, green, blue and alpha values.
     
     ## Example:
     ```swift
     let white = NSColor(red: 255, green: 255, blue: 255)
     ```
     
     - Parameters:
         - red: A number between 0 and 255.
         - green: A number between 0 and 255.
         - blue: A number between 0 and 255.
         - alpha: A percentage between 0 and 100.
     */
    public convenience init(red: Int, green: Int, blue: Int, alpha: Int = 100) {
        let r = CGFloat(red) / 255.0
        let g = CGFloat(green) / 255.0
        let b = CGFloat(blue) / 255.0
        let a = CGFloat(alpha) / 100.0
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    /**
     Initialize a `NSColor` from the given tuple of red, green, blue and alpha values where:
     
     * `red` - Is a number between 0 and 255.
     * `green` - Is a number between 0 and 255.
     * `blue` - Is a number between 0 and 255.
     * `alpha` - Is a percentage between 0 and 100.
     
     ## Example:
     ```swift
     let white = NSColor(fromRGBA: (red: 255, green: 255, blue: 255, alpha: 100))
     ```
     
     - Parameter rgbComponents: A tuple of red, green, blue and alpha values.
     */
    public convenience init (fromRGBA rgbComponents: (red: Int, green: Int, blue: Int, alpha: Int)) {
        let r = CGFloat(rgbComponents.red) / 255.0
        let g = CGFloat(rgbComponents.green) / 255.0
        let b = CGFloat(rgbComponents.blue) / 255.0
        let a = CGFloat(rgbComponents.alpha) / 100.0
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    /**
     Initializes a `NSColor` from the given hue, saturation, brightness and alpha values.
     
     ## Example:
     ```swift
     let red = NSColor(hue: 0, saturation: 100, brightness: 100)
     ```
     
     - Parameters:
         - hue: A number between 0 and 360.
         - saturation: A percentage between 0 and 100.
         - brightness: A percentage between 0 and 100.
         - alpha: A percentage between 0 and 100.
     */
    public convenience init (hue: Int, saturation: Int, brightness: Int, alpha: Int = 100) {
        let h = CGFloat(hue) / 360.0
        let s = CGFloat(saturation) / 100.0
        let b = CGFloat(brightness) / 100.0
        let a = CGFloat(alpha) / 100.0
        
        self.init(hue: h, saturation: s, brightness: b, alpha: a)
    }
    
    /**
     Initializes a `NSColor` from the given tuple of hue, saturation, brightness and alpha values where:
     
     * `hue` - Is a number between 0 and 360.
     * `saturation` - Is a percentage between 0 and 100.
     * `brightness` - Is a percentage between 0 and 100.
     * `alpha` - Is a percentage between 0 and 100.
     
     ## Example:
     ```swift
     let red = NSColor(fromHSBA: (hue: 0, saturation: 100, brightness: 100, alpha: 100))
     ```
     
     - Parameter hsbComponents: A tuple of hue, saturation, brightness and alpha values.
     */
    public convenience init(fromHSBA hsbComponents: (hue: Int, saturation: Int, brightness: Int, alpha: Int)) {
        let h = CGFloat(hsbComponents.hue) / 360.0
        let s = CGFloat(hsbComponents.saturation) / 100.0
        let b = CGFloat(hsbComponents.brightness) / 100.0
        let a = CGFloat(hsbComponents.alpha) / 100.0
        
        self.init(hue: h, saturation: s, brightness: b, alpha: a)
    }
    
    // MARK: - Computed Properties
    /**
     Returns the red, green, blue and alpha components of the given color where:
     
     * `red` - Is a number between 0 and 255.
     * `green` - Is a number between 0 and 255.
     * `blue` - Is a number between 0 and 255.
     * `alpha` - Is a percentage between 0 and 100.
     
     ## Example:
     ```swift
     let components = NSColor.red.rgbComponents
     print(components.red)
     ```
     */
    public var rgbComponents: (red: Int, green: Int, blue: Int, alpha: Int) {
        get {
            var (red, green, blue, alpha) = (CGFloat(0.0), CGFloat(0.0), CGFloat(0.0), CGFloat(0.0))
            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            return (red: Int(red * 255.0), green: Int(green * 255.0), blue: Int(blue * 255.0), alpha: Int(alpha * 100.0))
        }
    }
    
    /**
     Returns the alpha value of the color as a percentage between 0 and 100.
     
     ## Example:
     ```swift
     let alpha = NSColor.red.alphaValue
     ```
     */
    public var alphaValue: Int {
        get {return rgbComponents.alpha}
    }
    
    /**
     Returns the red value of the color as a number between 0 and 255.
     
     ## Example:
     ```swift
     let red = NSColor.red.redValue
     ```
     */
    public var redValue: Int {
        get {return rgbComponents.red}
    }
    
    /**
     Returns the green value of the color as a number between 0 and 255.
     
     ## Example:
     ```swift
     let green = NSColor.red.greenValue
     ```
     */
    public var greenValue: Int {
        get {return rgbComponents.green}
    }
    
    /**
     Returns the blue value of the color as a number between 0 and 255.
     
     ## Example:
     ```swift
     let blue = NSColor.red.blueValue
     ```
     */
    public var blueValue: Int {
        get {return rgbComponents.blue}
    }
    
    /**
     Returns the hue, saturation, brightness (value) and alpha component of the given color where:
     
     * `hue` - Is a number between 0 and 360.
     * `saturation` - Is a percentage between 0 and 100.
     * `brightness` - Is a percentage between 0 and 100.
     * `alpha` - Is a percentage between 0 and 100.
     
     ## Example:
     ```swift
     let components = NSColor.red.hsbComponents
     print(components.hue)
     ```
     */
    public var hsbComponents: (hue: Int, saturation: Int, brightness: Int, alpha: Int) {
        get {
            var (hue, saturation, brightness, alpha) = (CGFloat(0.0), CGFloat(0.0), CGFloat(0.0), CGFloat(0.0))
            self.getRed(&hue, green: &saturation, blue: &brightness, alpha: &alpha)
            return (hue: Int(hue * 360.0), saturation: Int(saturation * 100.0), brightness: Int(brightness * 100.0), alpha: Int(alpha * 100.0))
        }
    }
    
    /**
     Returns the hue value of the color as a number between 0 and 360.
     
     ## Example:
     ```swift
     let hue = NSColor.red.hueValue
     ```
     */
    public var hueValue: Int {
        get { return hsbComponents.hue}
    }
    
    /**
     Returns the saturation value of the color as a percentage between 0 and 100.
     
     ## Example:
     ```swift
     let saturation = NSColor.red.saturationValue
     ```
     */
    public var saturationValue: Int {
        get {return hsbComponents.saturation}
    }
    
    /**
     Returns the brightness value of the color as a percentage between 0 and 100.
     
     ## Example:
     ```swift
     let brightness = NSColor.red.brightnessValue
     ```
     */
    public var brightnessValue: Int {
        get {return hsbComponents.brightness}
    }
    
    /**
     Returns the shade and alpha of a given gray scale color where:
     
     * `shade` - Is a number between 0 and 255.
     * `alpha` - Is a percentage between 0 and 100.
     
     ## Example:
     ```swift
     let components = NSColor.gray.grayScaleComponents
     print(components.shade)
     ```
     */
    public var grayScaleComponents: (shade: Int, alpha: Int) {
        get {
            var (red, green, blue, alpha) = (CGFloat(0.0), CGFloat(0.0), CGFloat(0.0), CGFloat(0.0))
            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            return (shade: Int(red * 255.0), alpha: Int(alpha * 100.0))
        }
    }
    
    /**
     Returns the gray scale shade of the color as a number between 0 and 255.
     
     ## Example:
     ```swift
     let shade = NSColor.gray.shadeValue
     ```
     */
    public var shadeValue: Int {
        get { return grayScaleComponents.shade}
    }
    
    // MARK: - Public Functions
    /**
     Converts a `NSColor` to a hex string in the format `rrggbb` or `rrggbbaa` where:
     
     * `rr` - Specifies the red component as a hex value in the range 00 to FF.
     * `gg` - Specifies the green component as a hex value in the range 00 to FF.
     * `bb` - Specifies the blue component as a hex value in the range 00 to FF.
     * `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
     
     The hex string can optionally start with the prefix of `#`.
     
     ## Examples:
     ```swift
     // Assign a color from a string in macOS
     let colorHex = NSColor.red.toHex();
     let colorHexShort = NSColor.red.toHex(withPrefix: false, includeAlpha: false);
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
            return prefix + String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255.0), lroundf(g * 255.0), lroundf(b * 255.0), lroundf(a * 255.0))
        } else {
            return prefix + String(format: "%02lX%02lX%02lX", lroundf(r * 255.0), lroundf(g * 255.0), lroundf(b * 255.0))
        }
    }
    
    /**
     Returns a color based off of this color with the given alpha value.
     
     ## Example:
     ```swift
     let color = NSColor.white.withAlphaValue(50)
     ```
     
     - Parameter alpha: A percentage between 0 and 100.
     */
    public func withAlphaValue(_ alpha: Int) -> NSColor {
        var components = rgbComponents
        components.alpha = alpha
        return NSColor(fromRGBA: components)
    }
    
    /**
     Returns a color based off of this color with the given red value.
     
     ## Example:
     ```swift
     let color = NSColor.white.withRedValue(255)
     ```
     
     - Parameter red: A number between 0 and 255.
     */
    public func withRedValue(_ red: Int) -> NSColor {
        var components = rgbComponents
        components.red = red
        return NSColor(fromRGBA: components)
    }
    
    /**
     Returns a color based off of this color with the given green value.
     
     ## Example:
     ```swift
     let color = NSColor.white.withGreenValue(255)
     ```
     
     - Parameter green: A number between 0 and 255.
     */
    public func withGreenValue(_ green: Int) -> NSColor {
        var components = rgbComponents
        components.green = green
        return NSColor(fromRGBA: components)
    }
    
    /**
     Returns a color based off of this color with the given blue value.
     
     ## Example:
     ```swift
     let color = NSColor.white.withBlueValue(255)
     ```
     
     - Parameter blue: A number between 0 and 255.
     */
    public func withBlueValue(_ blue: Int) -> NSColor {
        var components = rgbComponents
        components.blue = blue
        return NSColor(fromRGBA: components)
    }
    
    /**
     Returns a color based off of this color with the given hue value.
     
     ## Example:
     ```swift
     let color = NSColor.white.withHueValue(100)
     ```
     
     - Parameter hue: A number between 0 and 360.
     */
    public func withHueValue(_ hue: Int) -> NSColor {
        var components = hsbComponents
        components.hue = hue
        return NSColor(fromHSBA: components)
    }
    
    /**
     Returns a color based off of this color with the given saturation value.
     
     ## Example:
     ```swift
     let color = NSColor.white.withSaturationValue(100)
     ```
     
     - Parameter saturation: A percentage between 0 and 100.
     */
    public func withSaturationValue(_ saturation: Int) -> NSColor {
        var components = hsbComponents
        components.saturation = saturation
        return NSColor(fromHSBA: components)
    }
    
    /**
     Returns a color based off of this color with the given brightness value.
     
     ## Example:
     ```swift
     let color = NSColor.white.withBrightnessValue(100)
     ```
     
     - Parameter brightness: A percentage between 0 and 100.
     */
    public func withBrightnessValue(_ brightness: Int) -> NSColor {
        var components = hsbComponents
        components.brightness = brightness
        return NSColor(fromHSBA: components)
    }
}
