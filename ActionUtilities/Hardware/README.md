# Hardware Utilities

**Hardware Utilities** provide commonly used information about the device an app is running on such as the device type (for example `iPhoneX`), the OS version (for example `iOS 11.1`) and if the app can connect to the internet.

The following is included:

* [AppleHardwareType](#AppleHardwareType) - Enum that contains a human-readable Apple Device Type (such as `iPhoneX`).
* [HardwareInformation](#HardwareInformation) - Provides information about the device an app is running on.

<a name="AppleHardwareType"></a>
## AppleHardwareType

Used to convert an Apple device model name (in the form `iPhone10,3`) to a human readable form (such as `iPhoneX`). This enum works with the `HardwareInformation` class to get the type of device the app is running on.

### Known Device Types

The following device types are handled:

#### iPhone:

* `iPhone` - The original version.
* `iPhone3G`
* `iPhone3GS`
* `iPhone4`
* `iPhone4S`
* `iPhone5`
* `iPhone5C`
* `iPhone5S`
* `iPhone6`
* `iPhone6Plus`
* `iPhone6S`
* `iPhone6SPlus`
* `iPhoneSE`
* `iPhone7`
* `iPhone7Plus`
* `iPhone8`
* `iPhone8Plus`
* `iPhoneX`

#### iPad

* `iPad` - The original version.
* `iPad2`
* `iPadMini`
* `iPad3`
* `iPad4`
* `iPadAir`
* `iPadMini2`
* `iPadMini3`
* `iPadMini4`
* `iPadAir2`
* `iPadPro12In`
* `iPadPro9In`
* `iPad5thGen`
* `iPadPro12In2ndGen`
* `iPadPro10In`

#### iPod Touch

* `iPodTouch` - The original version.
* `iPodTouch2ndGen`
* `iPodTouch3rdGen`
* `iPodTouch4thGen`
* `iPodTouch6thGen`

### Example:

```swift
let device = AppleHardwareType(fromModel: "iPhone10,3") 
```

<a name="HardwareInformation"></a>
## HardwareInformation

Defines a set of convenience properties and functions when working on Apple devices, such as checking the device model name (`iPhone10,3`), getting the device type (`iPhoneX`), getting the OS version (`iOS 11.1`), the current device orientation and internet connection state.

The following properties are available:

### isPhone

Returns `true` if the app is running on an iPhone, else returns `false`. For example:

```swift
if HardwareInformation.isPhone {
	// App is running on an iPhone
	...
}
```

### isPad

Returns `true` if the app is running on an iPad, else returns `false`. For example:

```swift
if HardwareInformation.isPad {
	// App is running on an iPad
	...
}
```

### isTV

Returns `true` if the app is running on an Apple TV, else returns `false`. For example:

```swift
if HardwareInformation.isTV {
	// App is running on an Apple TV
	...
}
```

### isCar

Returns `true` if the app is running on a CarPlay connected device, else returns `false`. For example:

```swift
if HardwareInformation.isCar {
	// App is running on CarPlay
	...
}
```

### modelName

Returns the model name of the device the app is running on. For example, `iPhone10,3` or `iPhone10,6` for the `iPhone X`. For example:

```swift
let model = HardwareInformation.modelName 
```

### deviceType

Returns the human-readable type of the device that the app is running on (for example `iPhoneX`) or `unknown` if the type cannot be discovered. For example:

```swift
if HardwareInformation.deviceType == .iPhoneX {
	// The app is running on an iPhone X
	...
}
```

### osVersion

Returns the version number (for example `iOS 11.1`) of the OS installed on the device that the app is running on. For example:

```swift
let version = HardwareInformation.osVersion
```

### deviceOrientation

Returns the current orientation of the device that the app is running on. If the orientation is unknown, a guess will be made based on the main screen's bounds: if the `width` is less than the `height`, `portrait` is returned, else `landscapeLeft` is returned. For example:

```swift
if HardwareInformation.deviceOrientation == .portrait {
	// The device is in the portrait position
	...
}
```

### isRetinaDisplay

Returns `true` if the device the app is running on has a retina display, else returns `false`. For example:

```swift
if HardwareInformation.isRetinaDisplay {
	// The device has a Retina display
	...
}
```

### isHDDisplay

Returns `true` if the device the app is running on has a HD display, else returns `false`. For example:

```swift
if HardwareInformation.isHDDisplay {
	// The device has a HD display
	...
}
```

### screenBounds

Returns the bounds of the main screen of the device that the app is running on. As of iOS 8.0, these bounds will always be relative to the device's orientation. For example:

```swift
let bounds = HardwareInformation.screenBounds
```

### isConnectedToNetwork

Returns `true` if the device the app is running on is connected to the internet, else returns `false`. For example:

```swift
if HardwareInformation.isConnectedToNetwork {
	// The device has an internet connection
	...
}
```

### isWWANNetworkConnection

Returns `true` if the device the app is running on is connected to the internet via a cellular connection, such as EDGE or GPRS, else returns `false`. For example:

```swift
if HardwareInformation.isWWANNetworkConnection {
	// The device has an internet via cellular
	...
}
```