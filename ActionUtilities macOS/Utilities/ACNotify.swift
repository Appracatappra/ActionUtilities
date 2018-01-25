//
//  ACNotify.swift
//  ActionUtilities macOS
//
//  Created by Kevin Mullins on 1/24/18.
//

import Foundation

/**
 `ACNotify` provides a simple Toast-like popup notification that is displayed in the Mac's notification center.
 
 ## Example:
 ```swift
 // Display popup notification
 ACNotify.showMessage(text: "Hello World!")
 ```
 */
public class ACNotify {
    
    // MARK: - Functions
    /**
     Displays a simple Toast-like popup notification in the Mac's notification center.
     
     ## Example:
     ```swift
     // Display popup notification in macOS
     ACNotify.showMessage(text: "Hello World!")
     ```
     - Parameter text: The message to display in the popup.
     */
    public static func showMessage(text: String) {
        let notification = NSUserNotification()
        
        // All these values are optional
        notification.title = "NOTICE"
        notification.subtitle = "Trial Framework Version"
        notification.informativeText = text
        //notification.contentImage = contentImage
        notification.soundName = NSUserNotificationDefaultSoundName
        
        NSUserNotificationCenter.default.deliver(notification)
    }
    
    /**
     Displays a simple Toast-like popup notification in the Mac's notification center.
     
     ## Example:
     ```swift
     // Display popup notification with extra information
     ACNotify.showMessage(title: "NOTIFICATION", subtitle: "Sample Notification", text: "Hello World!")
     ```
     - Parameters:
         - title: The title of the notification.
         - subtitle: The subtitle of the notification.
         - text: The message to display in the popup.
         - icon: The optional icon image for the message.
     */
    public static func showMessage(title: String, subtitle: String, text: String, icon: NSImage? = nil) {
        let notification = NSUserNotification()
        
        // All these values are optional
        notification.title = title
        notification.subtitle = subtitle
        notification.informativeText = text
        if let contentImage = icon {
            notification.contentImage = contentImage
        }
        notification.soundName = NSUserNotificationDefaultSoundName
        
        NSUserNotificationCenter.default.deliver(notification)
    }

}
