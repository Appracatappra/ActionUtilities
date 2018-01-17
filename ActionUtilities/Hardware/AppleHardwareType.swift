//
//  iOSDeviceType.swift
//  ActionUtilities
//
//  Created by Kevin Mullins on 1/16/18.
//  Copyright © 2018 Appracatappra, LLC. All rights reserved.
//

import Foundation

/**
 Used to convert an Apple device model name (in the form "iPhone10,3") to a human readable form (such as "iPhoneX"). This enum works with the `HardwareInformation` class to get the type of device the app is running on.
 */
public enum AppleHardwareType {
    case unknown
    
    case iPhone
    case iPhone3G
    case iPhone3GS
    case iPhone4
    case iPhone4S
    case iPhone5
    case iPhone5C
    case iPhone5S
    case iPhone6
    case iPhone6Plus
    case iPhone6S
    case iPhone6SPlus
    case iPhoneSE
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    
    case iPad
    case iPad2
    case iPadMini
    case iPad3
    case iPad4
    case iPadAir
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadAir2
    case iPadPro12In
    case iPadPro9In
    case iPad5thGen
    case iPadPro12In2ndGen
    case iPadPro10In
    
    case iPodTouch
    case iPodTouch2ndGen
    case iPodTouch3rdGen
    case iPodTouch4thGen
    case iPodTouch6thGen
    
    /**
     Takes a device model name in the form "iPhone10,3" and sets the enum to its human readable counterpart "iPhoneX".
     
     - Parameter model: The given device model string to convert.
     - Returns: The human readable name or `unknown` if unable to convert.
    */
    public init(fromModel model: String) {
        switch model {
        case "iPhone1,1":
            self = .iPhone
        case "iPhone1,2":
            self = .iPhone3G
        case "iPhone2,1":
            self = .iPhone3GS
        case "iPhone3,1", "iPhone3,3":
            self = .iPhone4
        case "iPhone4,1":
            self = .iPhone4S
        case "iPhone5,1", "iPhone5,2":
            self = .iPhone5
        case "iPhone5,3", "iPhone5,4":
            self = .iPhone5C
        case "iPhone6,1", "iPhone6,2":
            self = .iPhone5S
        case "iPhone7,1":
            self = .iPhone6Plus
        case "iPhone7,2":
            self = .iPhone6
        case "iPhone8,1":
            self = .iPhone6S
        case "iPhone8,2":
            self = .iPhone6SPlus
        case "iPhone8,4":
            self = .iPhoneSE
        case "iPhone9,1", "iPhone9,3":
            self = .iPhone7
        case "iPhone9,2", "iPhone9,4":
            self = .iPhone7Plus
        case "iPhone10,1", "iPhone10,4":
            self = .iPhone8
        case "iPhone10,2", "iPhone10,5":
            self = .iPhone8Plus
        case "iPhone10,3", "iPhone10,6":
            self = .iPhoneX
        case "iPad1,1":
            self = .iPad
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
            self = .iPad2
        case "iPad2,5", "iPad2,6", "iPad2,7":
            self = .iPadMini
        case "iPad3,1", "iPad3,2", "iPad3,3":
            self = .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6":
            self = .iPad4
        case "iPad4,1", "iPad4,2", "iPad4,3":
            self = .iPadAir
        case "iPad4,4", "iPad4,5", "iPad4,6":
            self = .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":
            self = .iPadMini3
        case "iPad5,1", "iPad5,2":
            self = .iPadMini4
        case "iPad5,3", "iPad5,4":
            self = .iPadAir2
        case "iPad6,3", "iPad6,4":
            self = .iPadPro12In
        case "iPad6,7", "iPad6,8":
            self = .iPadPro9In
        case "iPad6,11", "iPad6,12":
            self = .iPad5thGen
        case "iPad7,1", "iPad7,2":
            self = .iPadPro12In2ndGen
        case "iPad7,3", "iPad7,4":
            self = .iPadPro10In
        case "iPod1,1":
            self = .iPodTouch
        case "iPod2,1":
            self = .iPodTouch2ndGen
        case "iPod3,1":
            self = .iPodTouch3rdGen
        case "iPod4,1":
            self = .iPodTouch4thGen
        case "iPod7,1":
            self = .iPodTouch6thGen
        default:
            self = .unknown
        }
    }
}
