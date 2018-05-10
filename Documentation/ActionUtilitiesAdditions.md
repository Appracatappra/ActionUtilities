# Action Utilities Additions
## Version 01.02.00

Today we released a new version of our Swift and Xcode [open source](https://github.com/Appracatappra/ActionUtilities) Action Utilities framework of time saving utilities and functions to solve common tasks across a wide range of mobile and desktop apps.

Version 01.02.00 focuses on additions to our `UIColor` and `NSColor` extensions, adding useful features that make it easy to do common tasks needed to manipulate colors, something we tend to do a lot of when creating reusable UI controls and frameworks.

In many cases, these additions add the ability to specify colors as a number rage from 0 to 255 rather than 0.0 to 1.0, because it's the traditional format used by most graphic apps. For numbers that represent a percentage, such as transparency (`alpha`), we've used 0 to 100 instead of 0.0 to 0.1.

These changes are broken down into the following categories:

* [Initializers](#Initializers)
* [Computed Properties](#Computed-Properties)
* [Functions](#Functions)
* [Summary](#Summary)

<a name="Initializers"></a>
## Initializers

The following new initialization routines were added:

### init(fromGrayScaleShade, withAlphaPercent)

Creates a new gray scale color for the given shade (0 to 255) with the given transparency. For example:

```swift
let gray = UIColor(fromGrayScaleShade: 200)
```

### init(red, green, blue, alpha)

Creates a new color from the red (0-255), green (0-255), blue (0-255) and alpha (0-100) values. For example:

```swift
let white = UIColor(red: 255, green: 255, blue: 255)
```

### init(fromRGBA)

Creates a new color from a tuple of red (0-255), green (0-255), blue (0-255) and alpha (0-100) values. For example:

```swift
let white = UIColor(fromRGBA: (red: 255, green: 255, blue: 255, alpha: 100))
```

### init(hue, saturation, brightness, alpha)

Creates a new color from the given hue (0-360), saturation (0-100), brightness (0-100) and alpha (0-100) values. For example:

```swift
let red = UIColor(hue: 0, saturation: 100, brightness: 100)
```

### init(fromHSBA)

Creates a new color from a tuple of hue (0-360), saturation (0-100), brightness (0-100) and alpha (0-100) values. For example:

```swift
let red = UIColor(fromHSBA: (hue: 0, saturation: 100, brightness: 100, alpha: 100))
```

<a name="Computed-Properties"></a>
## Computed Properties

The following computed properties were added:

### rgbComponents

Returns a tuple of red, green, blue and alpha values where:

* `red` - Is a number between 0 and 255.
* `green` - Is a number between 0 and 255.
* `blue` - Is a number between 0 and 255.
* `alpha` - Is a percentage between 0 and 100.

For example:

```swift
let components = UIColor.red.rgbComponents
print(components.red)
```

### alphaValue

Returns the alpha value of a color as 0 to 100. For example:

```swift
let alpha = UIColor.red.alphaValue
```

### redValue

Returns the red value of a color as 0 to 255. For example:

```swift
let red = UIColor.red.redValue
```

### greenValue

Returns the green value of a color as 0 to 255. For example:

```swift
let green = UIColor.red.greenValue
```

### blueValue

Returns the blue value of a color as 0 to 255. For example:

```swift
let blue = UIColor.red.blueValue
```

### hsbComponents

Returns a tuple of hue, saturation, brightness and alpha values where:

* `hue` - Is a number between 0 and 360.
* `saturation` - Is a percentage between 0 and 100.
* `brightness` - Is a percentage between 0 and 100.
* `alpha` - Is a percentage between 0 and 100.

For example:

```swift
let components = UIColor.red.hsbComponents
print(components.hue)
```

### hueValue

Returns the hue value of a color as 0 to 360. For example:

```swift
let hue = UIColor.red.hueValue
```

### saturationValue

Returns the saturation value of a color as 0 to 100. For example:

```swift
let saturation = UIColor.red.saturationValue
```

### brightnessValue

Returns the brightness value of a color as 0 to 100. For example:

```swift
let brightness = UIColor.red.brightnessValue
```

### grayScaleComponents

Returns a tuple of the shade of a gray scale color (0-255) and alpha (0-100). For example:

```swift
let components = UIColor.gray.grayScaleComponents
print(components.shade)
```

**NOTE:** This property assumes that the color is actually a shade of gray. Internally the `red` component is returned as the `shade` value.

### shadeValue

Returns the shade of gray for the color as 0 to 255. For example:

```swift
let shade = UIColor.gray.shadeValue
```

**NOTE:** This property assumes that the color is actually a shade of gray. Internally the `red` component is returned as the `shade` value.


<a name="Functions"></a>
## Functions

The following functions were added:

### withAlphaValue(alpha)

Creates a new color from the existing color by replacing the alpha value with the given value (0-100). For example:

```swift
let color = UIColor.white.withAlphaValue(50)
```

### withRedValue(red)

Creates a new color from the existing color by replacing the red value with the given value (0-255). For example:

```swift
let color = UIColor.white.withRedValue(255)
```

### withGreenValue(green)

Creates a new color from the existing color by replacing the green value with the given value (0-255). For example:

```swift
let color = UIColor.white.withGreenValue(255)
```

### withBlueValue(blue)

Creates a new color from the existing color by replacing the blue value with the given value (0-255). For example:

```swift
let color = UIColor.white.withBlueValue(255)
```

### withHueValue(hue)

Creates a new color from the existing color by replacing the hue value with the given value (0-360). For example:

```swift
let color = UIColor.white.withHueValue(360)
```

### withSaturationValue(saturation)

Creates a new color from the existing color by replacing the saturation value with the given value (0-100). For example:

```swift
let color = UIColor.white.withSaturationValue(50)
```

### withBrightnessValue(brightness)

Creates a new color from the existing color by replacing the brightness value with the given value (0-100). For example:

```swift
let color = UIColor.white.withBrightnessValue(50)
```

<a name="Summary"></a>
## Summary

While none of these enhancements are groundbreaking, or particularly difficult for that matter, they are nice to have and make it easier to do common color manipulation tasks. To find out more, please check out our [Action Utilities](http://appracatappra.com/products/action-utilities/) website or our [Action Utilities Developer Center](http://appracatappra.com/developers/action-utilities-help/).

We have full API documentation available as well:

* For [iOS](http://appracatappra.com/api/actionutilities/ios/)
* For [tvOS](http://appracatappra.com/api/actionutilities/tvos/)
* For [watchOS](http://appracatappra.com/api/actionutilities/watchos/)
* For [macOS](http://appracatappra.com/api/actionutilities/macos/)


