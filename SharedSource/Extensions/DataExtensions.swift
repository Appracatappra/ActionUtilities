//
//  DataExtensions.swift
//  CoderPlayground
//
//  Created by Kevin Mullins on 9/27/17.
//  Copyright © 2017 Appracatappra, LLC. All rights reserved.
//

import Foundation
import UIKit

/**
 Extends `Data` to support the Action Data controls and adds convenience methods for working with data properties in a `Codable`, `Encodable` or `Decodable` class.
 
 ## Examples:
 ```swift
 // Assign data from an image in iOS, tvOS or watchOS
 let imageData: Data ~= UIImage(named: "Background.png")
 ```
*/
extension Data {
    
    // MARK: - Custom Operators
    /**
     Sets the `Data` instance from the given `UIImage` instance.
     
     ## Examples:
     ```swift
     // Assign data from an image in iOS, tvOS or watchOS
     let imageData: Data ~= UIImage(named: "Background.png")
     ```
     */
    public static func ~= ( left: inout Data, right: UIImage) {
        left = right.toData()!
    }
    
    // MARK: - Public Properties
    /**
     Attempts to create a `UIImage` from the data stored in the current `Data` instance. Returns the Image if it can be created else returns `nil`.
     
     ## Examples:
     ```swift
     // Assign data from an image in iOS, tvOS or watchOS
     let imageData: Data ~= UIImage(named: "Background.png")
     if let image = imageData.uiImage {
        ...
     }
     ```
     */
    public var uiImage: UIImage? {
        return UIImage(data: self)
    }
}
