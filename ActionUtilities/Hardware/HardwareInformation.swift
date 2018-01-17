//
//  iOSDevice.swift
//  ActionUtilities
//
//  Created by Kevin Mullins on 1/16/18.
//  Copyright © 2018 Appracatappra, LLC. All rights reserved.
//

import Foundation
import SystemConfiguration

/**
 Defines a set of convenience properties and functions when working on Apple devices, such as checking the device model name (`iPhone10,3`), getting the device type (`iPhoneX`), getting the OS version, the current device orientation and internet connection state.
 */
public class HardwareInformation {
    
    /// Returns `true` if the app is running on an iPhone, else returns `false`.
    public static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    /// Returns `true` if the app is running on an iPad, else returns `false`.
    public static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    /// Returns `true` if the app is runnin on an Apple TV, else returns `false`.
    public static var isTV: Bool {
        return UIDevice.current.userInterfaceIdiom == .tv
    }
    
    /// Returns `true` if the app is running in Apple CarPlay, else returns `false`.
    public static var isCar: Bool {
        return UIDevice.current.userInterfaceIdiom == .carPlay
    }
    
    /// Returns the model name of the device the app is running on. For example, `iPhone10,3` or `iPhone10,6` for the `iPhone X`.
    public static var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        if let value = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] {
            return value
        } else {
            return identifier
        }
    }
    
    /// Returns the human readable type of the device that the app is running on (for example `iPhoneX`) or `unknown` if the type cannot be discovered.
    public static var deviceType: AppleHardwareType {
        return AppleHardwareType(fromModel: modelName)
    }
    
    /// Returns the version number (for example `iOS 11.1`) of the OS installed on the device that the app is running on.
    public static var osVersion: String {
        return "\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)"
    }
    
    /// Returns the current orientation of the device that the app is running on. If the orientation is unknown, a guess will be made based on the main screen's bounds: if the `width` is less than the `height`, `portrait` is returned, else `landscapeLeft` is returned.
    public static var deviceOrientation: UIDeviceOrientation {
        // Allow orientation information
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        
        // Get current orinetation
        let orientation = UIDevice.current.orientation
        
        // Stop receiving orientation
        UIDevice.current.endGeneratingDeviceOrientationNotifications()
        
        // Take action based on reported orientation
        if orientation == .unknown {
            // Attempt to determin from screen bounds
            if screenBounds.width < screenBounds.height {
                return .portrait
            } else {
                return .landscapeLeft
            }
        } else {
            return orientation
        }
    }
    
    /// Returns `true` if the device the app is running on has a retina display, else returns `false`.
    public static var isRetinaDisplay: Bool {
        return UIScreen.main.scale > 1.0
    }
    
    /// Returns `true` if the device the app is running on has a HD display, else returns `false`.
    public static var isHDDisplay: Bool {
        return UIScreen.main.scale > 2.0
    }
    
    /// Returns the bounds of the main screen of the device that the app is running on.
    /// - Remark: As of iOS 8.0, these bounds will always be relative to the device's orientation.
    public static var screenBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    /// Returns the screen bounds rotated to fit the current device oreintation. If the orientation cannot be discovered, the device is assumed to be in the `portrait` orientation.
    /// - Remark: This property is deprecated on iOS 8.0 and greater since the main screen bounds are always returned based on the device's orientation.
    @available(*, deprecated: 8.0)
    public static var rotatedScreenBounds: CGRect {
        // Take action based on the device orientation
        switch deviceOrientation {
        case .landscapeLeft, .landscapeRight:
            // Use the bigger value as the width
            if screenBounds.width > screenBounds.height {
                return CGRect(x: 0, y: 0, width: screenBounds.width, height: screenBounds.height)
            } else {
                return CGRect(x: 0, y: 0, width: screenBounds.height, height: screenBounds.width)
            }
        case .portrait, .portraitUpsideDown:
            // Use the smaller value as the width
            if screenBounds.width < screenBounds.height {
                return CGRect(x: 0, y: 0, width: screenBounds.width, height: screenBounds.height)
            } else {
                return CGRect(x: 0, y: 0, width: screenBounds.height, height: screenBounds.width)
            }
        default:
            // Use the smaller value as the width
            if screenBounds.width < screenBounds.height {
                return CGRect(x: 0, y: 0, width: screenBounds.width, height: screenBounds.height)
            } else {
                return CGRect(x: 0, y: 0, width: screenBounds.height, height: screenBounds.width)
            }
        }
    }
    
    /// Returns `true` if the device the app is running on is connected to the internet, else returns `false`.
    public static var isConnectedToNetwork: Bool {
        // Attempt to reach out to google
        guard let reachability = SCNetworkReachabilityCreateWithName(nil, "www.google.com") else { return false}
        
        // Get the status flags of the connection attempt
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability, &flags)
        
        // Test for contion status
        return isNetworkReachable(with: flags)
    }
    
    /// Returns `true` if the device the app is running on is connected to the internet via a cellular connection, such as EDGE or GPRS, else returns `false`.
    public static var isWWANNetworkConnection: Bool {
        // Attempt to reach out to google
        guard let reachability = SCNetworkReachabilityCreateWithName(nil, "www.google.com") else { return false}
        
        // Get the status flags of the connection attempt
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability, &flags)
        
        #if os(iOS)
            // Is a WWAN connection?
            if flags.contains(.isWWAN) {
                return true
            }
        #endif
        
        // Default to false
        return false
    }
    
    /// Private function to test for network connection status.
    /// - Parameter flags: The `SCNetworkReachabilityFlags` returned from a connection test.
    /// - Returns: `true` if connection is available, else returns `false`.
    static func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
        
        return isReachable && (!needsConnection || canConnectWithoutUserInteraction)
    }
}
