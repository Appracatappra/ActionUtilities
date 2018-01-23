//
//  ImageExtensions.swift
//  CoderPlayground
//
//  Created by Kevin Mullins on 9/26/17.
//  Copyright © 2017 Appracatappra, LLC. All rights reserved.
//

import Foundation
import UIKit

/**
 Extends `UIImage` to support the Action Data controls and adds convenience methods for working with image properties in a `Codable`, `Encodable` or `Decodable` class.
 
*/
extension UIImage {

    /**
     Defines the Image Representation Format that will be used when converting a `UIImage` to `String` (via `toString()`) or to `Data` (via `toData()`).
     */
    public enum ImageRepresentationFormat {
        /// Converts the `UIImage` to a PGN format.
        case pngRepresentation
        
        /// Converts the `UIImage` to a JPG format with the given Image Quality of `0` (lowest) to `100` (highest).
        case jpgRepresentation(imageQuality: Int)
    }
    
    // MARK: - Custom Operators
    /**
     Sets the `UIImage` from the given `String` Instance.
     */
    public static func ~= ( left: inout UIImage, right: String) {
        left = right.uiImage!
    }
    
    /**
     Sets the `UIImage` from the given `Data` instance.
     */
    public static func ~= ( left: inout UIImage, right: Data) {
        left = right.uiImage!
    }
    
    // MARK: - Public Functions
    /**
     Converts the `UIImage` to a `String` representation encoded in Base 64.
     
     - Parameter imageRepresentation: Determines the representation that will be used when converting the image. The default is `pngRepresentation`.
     
     - Returns: The `UIImage` in the requested representation converted to a Base 64 encoded string.
     */
    public func toString(imageRepresentation: ImageRepresentationFormat = .pngRepresentation) -> String {
        var rawData: Data?
        
        // Take action based on the desired image representation
        switch imageRepresentation {
        case .pngRepresentation:
            rawData = UIImagePNGRepresentation(self)
        case .jpgRepresentation(let imageQuality):
            let quality = Float(imageQuality) * 0.01
            rawData = UIImageJPEGRepresentation(self, CGFloat(quality))
        }
        
        // Encode as base64 and return
        let base64 = rawData?.base64EncodedString(options: .lineLength64Characters)
        return base64!
    }
    
    /**
     Converst the `UIImage` to a `Data` representation.
     
     - Parameter imageRepresentation: Determins the representation that will be used when converting the image. The default is `pngRepresentation`.
     
     - Returns: The `UIImage` in the requested representation converted to a raw `Data`.
     */
    public func toData(imageRepresentation: ImageRepresentationFormat = .pngRepresentation) -> Data? {
        var rawData: Data?
        
        // Take action based on the desired image representation
        switch imageRepresentation {
        case .pngRepresentation:
            rawData = UIImagePNGRepresentation(self)
        case .jpgRepresentation(let imageQuality):
            let quality = Float(imageQuality) * 0.01
            rawData = UIImageJPEGRepresentation(self, CGFloat(quality))
        }
        
        // Return the requested data
        return rawData
    }
    
    // MARK: - Initializers
    /**
     Creates a new `UIImage` instance from a Base 64 encoded string.
     
     - Parameter value: A Base 64 encoded `String` representing an image.
     */
    public convenience init?(fromString value: String) {
        let data = Data(base64Encoded: value, options: .ignoreUnknownCharacters)
        self.init(data: data!)
    }
    
}
