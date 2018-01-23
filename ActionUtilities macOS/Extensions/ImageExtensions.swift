//
//  ImageExtensions.swift
//  ActionUtilities.macOS
//
//  Created by Kevin Mullins on 1/18/18.
//  Copyright © 2018 Appracatappra, LLC. All rights reserved.
//

import Foundation
import AppKit

/**
 Extends `NSBitmapImageRep` to support the Action Data controls and adds convenience methods for working with image properties in a `Codable`, `Encodable` or `Decodable` class.
 */
extension NSBitmapImageRep {
    
    /// Returns the bitmap as data in the png format.
    public var pngData: Data? {
        return representation(using: .png, properties: [:])
    }
    
    /// Returns the bitmap as data in the jpeg format.
    public var jpgData: Data? {
        return representation(using: .jpeg, properties: [:])
    }
}

/**
 Extends `NSImage` to support the Action Data controls and adds convenience methods for working with image properties in a `Codable`, `Encodable` or `Decodable` class.
 
 */
extension NSImage {
    
    /// Returns the image as data in the png format.
    public var pngData: Data? {
        if let tiffData = tiffRepresentation {
            if let bitmap = NSBitmapImageRep(data: tiffData) {
                return bitmap.pngData
            }
        }
        return nil
    }
    
    /// Returns the image as data in the jpeg format.
    public var jpgData: Data? {
        if let tiffData = tiffRepresentation {
            if let bitmap = NSBitmapImageRep(data: tiffData) {
                return bitmap.jpgData
            }
        }
        return nil    }
    
    /**
     Defines the Image Representation Format that will be used when converting a `NSImage` to `String` (via `toString()`) or to `Data` (via `toData()`).
     */
    public enum ImageRepresentationFormat {
        /// Converts the `NSImage` to a PGN format.
        case pngRepresentation
        
        /// Converts the `NSImage` to a JPG format with the given Image Quality of `0` (lowest) to `100` (highest).
        case jpgRepresentation(imageQuality: Int)
    }
    
    // MARK: - Custom Operators
    /**
     Sets the `NSImage` from the given `String` Instance.
     */
    public static func ~= ( left: inout NSImage, right: String) {
        left = right.nsImage!
    }
    
    /**
     Sets the `NSImage` from the given `Data` instance.
     */
    public static func ~= ( left: inout NSImage, right: Data) {
        left = right.nsImage!
    }
    
    // MARK: - Public Functions
    /**
     Converts the `NSImage` to a `String` representation encoded in Base 64.
     
     - Parameter imageRepresentation: Determines the representation that will be used when converting the image. The default is `pngRepresentation`.
     
     - Returns: The `NSImage` in the requested representation converted to a Base 64 encoded string.
     */
    public func toString(imageRepresentation: ImageRepresentationFormat = .pngRepresentation) -> String {
        var rawData: Data?
        
        // Take action based on the desired image representation
        switch imageRepresentation {
        case .pngRepresentation:
            rawData = pngData
        case .jpgRepresentation(_):
            //let quality = Float(imageQuality) * 0.01
            rawData = jpgData
        }
        
        // Encode as base64 and return
        let base64 = rawData?.base64EncodedString(options: .lineLength64Characters)
        return base64!
    }
    
    /**
     Converst the `NSImage` to a `Data` representation.
     
     - Parameter imageRepresentation: Determins the representation that will be used when converting the image. The default is `pngRepresentation`.
     
     - Returns: The `NSImage` in the requested representation converted to a raw `Data`.
     */
    public func toData(imageRepresentation: ImageRepresentationFormat = .pngRepresentation) -> Data? {
        var rawData: Data?
        
        // Take action based on the desired image representation
        switch imageRepresentation {
        case .pngRepresentation:
            rawData = pngData
        case .jpgRepresentation(_):
            //let quality = Float(imageQuality) * 0.01
            rawData = jpgData
        }
        
        // Return the requested data
        return rawData
    }
    
    // MARK: - Initializers
    /**
     Creates a new `NSImage` instance from a Base 64 encoded string.
     
     - Parameter value: A Base 64 encoded `String` representing an image.
     */
    public convenience init?(fromString value: String) {
        let data = Data(base64Encoded: value, options: .ignoreUnknownCharacters)
        self.init(data: data!)
    }
    
}
