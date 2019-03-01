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
 
 ## Examples:
 ```swift
 // Assign aa image from Base 64 encoded String in iOS, tvOS or watchOS
 let imageString = UIImage(named: "Background.png").toString()
 let image: UIImage ~= imageString
 ```
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
     Sets the `UIImage` from the given Base 64 encoded `String` instance.
     
     ## Examples:
     ```swift
     // Assign an image from Base 64 encoded String in iOS, tvOS or watchOS
     let imageString = UIImage(named: "Background.png").toString()
     let image: UIImage ~= imageString
     ```
     */
    public static func ~= ( left: inout UIImage, right: String) {
        left = right.uiImage!
    }
    
    /**
     Sets the `UIImage` from the given `Data` instance.
     
     ## Examples:
     ```swift
     // Assign an image from Base 64 encoded Data in iOS, tvOS or watchOS
     let imageData = UIImage(named: "Background.png").toData()
     let image: UIImage ~= imageData
     ```
     */
    public static func ~= ( left: inout UIImage, right: Data) {
        left = right.uiImage!
    }
    
    // MARK: - Public Functions
    /**
     Converts the `UIImage` to a `String` representation encoded in Base 64.
     
     ## Examples:
     ```swift
     // Assign an image to Base 64 encoded String in iOS, tvOS or watchOS
     let imageString = UIImage(named: "Background.png").toString()
     ```
     
     - Parameter imageRepresentation: Determines the representation that will be used when converting the image. The default is `pngRepresentation`.
     
     - Returns: The `UIImage` in the requested representation converted to a Base 64 encoded string.
     */
    public func toString(imageRepresentation: ImageRepresentationFormat = .pngRepresentation) -> String {
        var rawData: Data?
        
        // Take action based on the desired image representation
        switch imageRepresentation {
        case .pngRepresentation:
            rawData = self.pngData()
        case .jpgRepresentation(let imageQuality):
            let quality = Float(imageQuality) * 0.01
            rawData = self.jpegData(compressionQuality: CGFloat(quality))
        }
        
        // Encode as base64 and return
        let base64 = rawData?.base64EncodedString(options: .lineLength64Characters)
        return base64!
    }
    
    /**
     Converts the `UIImage` to a `Data` representation.
     
     ## Examples:
     ```swift
     // Assign an image to Base 64 encoded Data in iOS, tvOS or watchOS
     let imageData = UIImage(named: "Background.png").toString()
     ```
     
     - Parameter imageRepresentation: Determins the representation that will be used when converting the image. The default is `pngRepresentation`.
     
     - Returns: The `UIImage` in the requested representation converted to a raw `Data`.
     */
    public func toData(imageRepresentation: ImageRepresentationFormat = .pngRepresentation) -> Data? {
        var rawData: Data?
        
        // Take action based on the desired image representation
        switch imageRepresentation {
        case .pngRepresentation:
            rawData = self.pngData()
        case .jpgRepresentation(let imageQuality):
            let quality = Float(imageQuality) * 0.01
            rawData = self.jpegData(compressionQuality: CGFloat(quality))
        }
        
        // Return the requested data
        return rawData
    }
    
    // MARK: - Initializers
    /**
     Creates a new `UIImage` instance from a Base 64 encoded string.
     
     ## Examples:
     ```swift
     // Assign an image from Base 64 encoded String in iOS, tvOS or watchOS
     let imageString = UIImage(named: "Background.png")
     let image = UIImage(fromString: imageString)
     ```
     
     - Parameter value: A Base 64 encoded `String` representing an image.
     */
    public convenience init?(fromString value: String) {
        let data = Data(base64Encoded: value, options: .ignoreUnknownCharacters)
        self.init(data: data!)
    }
    
}
