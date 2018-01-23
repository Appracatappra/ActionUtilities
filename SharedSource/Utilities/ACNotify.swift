//
//  ACNotify.swift
//  ActionUtilities
//
//  Created by Kevin Mullins on 1/16/18.
//  Copyright © 2018 Appracatappra, LLC. All rights reserved.
//

import Foundation
import UIKit

/**
 `ACNotify` provides a simple Toast-like popup notification that is displayed at the bottom of the device's screen for 1 second before disappearing.
 
 ## Example:
 ```swift
 // Display popup notification
 ACNotify.showMessage(text: "Hello World!")
 ```
 */
public class ACNotify {
    
    // MARK: - Private variables
    static let duration: Double = 1.0
    static let fadeInDuration: Double = 0.3
    static let fadeOutDuration: Double = 0.5
    static var view: UIView?
    
    // MARK: - Functions
    /**
     Displays a simple Toast-like popup notification at the bottom of the device's screen for 1 second before disappearing.
     
     ## Example:
     ```swift
     // Display popup notification
     ACNotify.showMessage(text: "Hello World!")
     ```
     - Parameter text: The message to display in the popup.
    */
    public static func showMessage(text: String) {
        
        // Create a new button as the "body" of the toast popup
        let v = UIButton(type: UIButtonType.custom)
        view = v
        
        // Calculate the message metrix
        let font = UIFont.systemFont(ofSize: 16)
        let textSize = text.bounds(withConstrainedSize: CGSize(width: 280, height: 60), font: font)
        
        // Create a label to hold the message
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: textSize.width + 5, height: textSize.height + 5))
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.font = font
        label.text = text
        label.numberOfLines = 0
        
        // Adjust button body to hold message
        v.frame = CGRect(x: 0, y: 0, width: textSize.width + 10, height: textSize.height + 10)
        label.center = CGPoint(x: v.frame.size.width / 2, y: v.frame.size.height / 2)
        v.addSubview(label)
        
        // Style message
        v.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        v.layer.cornerRadius = 5
        
        // Gain access to the main window and calculate it's center position
        let window = UIApplication.shared.windows[0]
        let bounds = HardwareInformation.screenBounds
        let point = CGPoint(x: bounds.width / 2, y: bounds.height - 45)
        
        // Move view into position
        v.center = point
        v.alpha = 0.0
        
        // Insert message into window
        window.rootViewController?.view.addSubview(v)
        
        // Animate into view
        let animation = UIViewPropertyAnimator(duration: fadeInDuration, curve: .easeIn) {
            v.alpha = 1.0
        }
        
        // Add completion handler
        animation.addCompletion { (position) in
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
                hideToast()
            }
        }
        
        // Start animation
        animation.startAnimation()
        
    }
    
    static func hideToast() {
        // Anything to process
        if let v = view {
            // Animate out of view
            let animation = UIViewPropertyAnimator(duration: fadeOutDuration, curve: .easeOut) {
                v.alpha = 0.0
            }
            
            // Add completion handler
            animation.addCompletion { (position) in
                removeToast()
            }
            
            // Start animation
            animation.startAnimation()
        }
    }
    
    static func removeToast() {
        // Is a message currently displayed?
        if let v = view {
            // Yes, remove it from view
            v.removeFromSuperview()
            view = nil
        }
    }
    
    static func fadeInComplete() {
        Timer.scheduledTimer(withTimeInterval: TimeInterval(duration), repeats: false) { (timer) in
            hideToast()
        }
    }
    
}
