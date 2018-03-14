# Action Utilities

[Action Utilities](http://appracatappra.com/products/action-utilities/) provide several useful functions that are common across many apps written in Swift and Xcode. These include features such as getting the version of the OS installed on the device the app is running on, testing to see if an app can connect to the internet and getting the device type (for example `iPhoneX`).

Additionally, many built-in types (such as `UIColor`, `String` and `Data`) have been extended with useful features such as converting a color to and from a hex string and moving images easily between `Data` and `String` types to support Swift 4's `Codable` protocol.

**Action Utilities** are support on iOS, tvOS, watchOS and macOS. To find out more, please visit our [Action Utilities Developer Center](http://appracatappra.com/developers/action-utilities-help/).

<a name="Action-Extensions"></a>
## Action Extensions

**Action Extensions** provide several useful features to common, built-in Cocoa, Cocoa Touch and Swift data types such as converting `UIColor`/`NSColor` to/from hex strings (for example `#FF0000`), creating `UIImage`/`NSImage` instances from Base64 encoded strings stored in `Data` or `NSData` objects and encoding `UIImages`/`NSImages` as Base64 strings or `Data` objects.

#### iOS Examples:

```swift
// Assign a color from a string
let color: UIColor ~= "#FF0000"

// Initialize a color from a hex string
let green = UIColor(fromHex: "00FF00")

// Convert color to a hex string
let white = UIColor.white.toHex()
```

#### macOS Examples:

```swift
// Assign a color from a string
let color: NSColor ~= "#FF0000"

// Initialize a color from a hex string
let green = NSColor(fromHex: "00FF00")

// Convert color to a hex string
let white = NSColor.white.toHex()
```


<a name="General-Utilities"></a>
## General Utilities

**General Utilities** provide several, general utility classes to handle thing such as simple popup notifications.

### Examples:

```swift
// Display popup message at the bottom of the screen
ACNotify.showMessage(text: "Hello World!")
```

<a name="Hardware-Utilities"></a>
## Hardware Utilities

**Hardware Utilities** provide commonly used information about the device an app is running on such as the device type (for example `iPhoneX`), the OS version (for example `iOS 11.1`) and if the app can connect to the internet.

### Examples:

```swift
if HardwareInformation.deviceType == .iPhoneX {
	// The app is running on an iPhone X
	...
}

if HardwareInformation.isConnectedToNetwork {
	// The device has an internet connection
	...
} 
```

<a name="Free-to-Use"></a>
## Free to Use

Because of the basic nature of the functions and utilities provided by **Actions Utilities**, Appracatappra is offering them 100% free to use in any app project of your choosing. Additionally, we intent to keep expanding **Action Utilities** with new features which will also be provided free of charge.

<a name="MIT-License"></a>
### MIT License

Copyright © 2018 by [Appracatappra, LLC.](http://appracatappra.com)

--

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


