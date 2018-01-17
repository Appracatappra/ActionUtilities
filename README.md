# Action Utilities

**Action Utilities** provide several useful functions that are common across many apps written in Swift such as getting the version of the OS installed on the device the app is running on, testing to see if an app can connect to the internet and getting the type of device the app is running on (for example `iPhoneX`).

<a name="Action-Extensions"></a>
## Action Extensions

**Action Extensions** provide several useful features to common, built-in Cocoa, Cocoa Touch and Swift data types such as converting `UIColor` to/from hex strings (for example `#FF0000`), creating `UIImage` instances from Base64 encoded strings stored in `Data` or `NSData` objects and encoding `UIImages` as Base64 strings or `Data` objects.

#### Examples:

```swift
// Assign a color from a string
let color: UIColor ~= "#FF0000"

// Initialize a color from a hex string
let green = UIColor(fromHex: "00FF00")

// Convert color to a hex string
let white = UIColor.white.toHex()
```

<a name="General-Utilities"></a>
## General Utilities

**General Utilities** provide several, general utility classes to handle thing such as simple popup notifications.

### Examples:

```swift
ACNotify.showMessage(text: "Hello World!")
```

<a name="Hardware-Utilities"></a>
## Hardware Utilities

**Hardware Utilities** provide commonly used information about the device an app is running on such as the device type (for example `iPhoneX`), the OS version (for example `iOS 11.1`) and if the app can connect to the internet.

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


