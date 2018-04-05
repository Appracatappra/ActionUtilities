# What's New

###Version 01.02###

The following features and bug fixes have been added to `Action Utilities` in version 01.02. The initial release includes the following features:

* `UIColor` & `NSColor` Extensions:
	* `init(fromGrayScaleShade, withAlphaPercent)` - Creates a gray scale color with the given shade (0-255) and alpha (0-100) values.
	* `init(red, green, blue, alpha)` - Creates a color from the given red, green, blue values (0-255) and alpha percentage (0-100).
	* `init(fromRGBA)` - Creates a color from the given tuple of red, green, blue values (0-255) and alpha percentage (0-100).
	* `init(hue, saturation, brightness, alpha)` - Creates a color from the given hue (0-360), saturation (0-100), brightness (0-100) and alpha (0-100) values.
	* `init(fromHSBA)` - creates a color from the given tuple of hue (0-360), saturation (0-100), brightness (0-100) and alpha (0-100) values.
	* `rgbComponents` - Returns a tuple of red, green, blue values (0-255) and alpha percentage (0-100).
	* `alphaValue` - Returns the alpha value as a percentage (0-100).
	* `redValue` - Returns the red value (0-255).
	* `greenValue` - Returns the green value (0-255).
	* `blueValue` - Returns the blue value (0-255).
	* `hsbComponents` - Returns a tuple of hue (0-360), saturation (0-100), brightness (0-100) and alpha (0-100) values.
	* `hueValue` - Returns the hue value (0-360).
	* `saturationValue` - Returns the saturation value as a percentage (0-100).
	* `brightnessValue` - Returns the brightness value as a percentage (0-100).
	* `grayScaleComponents` - Returns a tuple of shade (0-255) and alpha (0-100).
	* `shadeValue` - Returns the shade value (0-255).
	* `withAlphaValue(alpha)` - Returns a color based on of the current color with the given alpha value (0-100).
	* `withRedValue(red)` - Returns a color based on of the current color with the given red value (0-255).
	* `withGreenValue(green)` - Returns a color based on of the current color with the given green value (0-255).
	* `withBlueValue(blue)` - Returns a color based on of the current color with the given blue value (0-255).
	* `withHueValue(hue)` - Returns a color based on of the current color with the given hue value (0-360).
	* `withSaturationValue(saturation)` - Returns a color based on of the current color with the given saturation value (0-100).
	* `withBrightnessValue(brightness)` - Returns a color based on of the current color with the given brightness value (0-100).

###Version 01.01###

The following features and bug fixes have been added to `Action Utilities` in version 01.01. The initial release includes the following features:

* **Documentation** - Fixed documentation for including the framework in an app project.
* **Minor Fixes** - Added several minor fixes to the framework.

###Version 01.00###

The following features and bug fixes have been added to `Action Utilities` in version 01.00. The initial release includes the following features:

* **Action Extensions** - Extend common, built-in Cocoa, Cocoa Touch and Swift data types.
* **General Utilities** - Add several, general utility classes to handle common tasks.
* **Hardware Utilities** - Provide information about the device that an app is running on.
