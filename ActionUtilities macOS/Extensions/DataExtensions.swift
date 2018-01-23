//
//  DataExtensions.swift
//  ActionUtilities.macOS
//
//  Created by Kevin Mullins on 1/18/18.
//  Copyright © 2018 Appracatappra, LLC. All rights reserved.
//

import Foundation
import AppKit

/**
 Extends `Data` to support the Action Data controls and adds convenience methods for working with data properties in a `Codable`, `Encodable` or `Decodable` class.
 */
extension Data {
    
    // MARK: - Custom Operators
    /**
     Sets the `Data` instance from the given `NSImage` instance.
     */
    public static func ~= ( left: inout Data, right: NSImage) {
        left = right.toData()!
    }
    
    // MARK: - Public Properties
    /**
     Attempts to create a `NSImage` from the data stored in the current `Data` instance. Returns the Image if it can be created else returns `nil`.
     */
    public var nsImage: NSImage? {
        return NSImage(data: self)
    }
}
