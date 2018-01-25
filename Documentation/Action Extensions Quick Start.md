# Action Extensions

**Action Extensions** provide several useful features to common, built-in Cocoa, Cocoa Touch and Swift data types such as converting `UIColor`/`NSColor` to/from hex strings (for example `#FF0000`), creating `UIImage`/`NSImage` instances from Base64 encoded strings stored in `Data` or `NSData` objects and encoding `UIImages`/`NSImages` as Base64 strings or `Data` objects.

The following extensions are available:

* [Color Extensions](#Color-Extensions) - Extends `UIColor/NSColor` to support the Action Data controls and adds convenience methods for working with colors in a `Codable`, `Encodable` or `Decodable` class.
* [Data Extensions](#Data-Extensions) - Extends `Data` to support the Action Data controls and adds convenience methods for working with data properties in a `Codable`, `Encodable` or `Decodable` class.
* [Image Extensions](#Image-Extensions) - Extends `UIImage/NSImage` to support the Action Data controls and adds convenience methods for working with image properties in a `Codable`, `Encodable` or `Decodable` class.
* [String Extensions](#String-Extensions) - Extends `String` to support the Action Data controls and adds convenience methods for working with `UIImage/NSImage` and `UIColor/NSColor` properties in a `Codable`, `Encodable` or `Decodable` class.


<a name="Color-Extensions"></a>
## Color Extensions

Extends `UIColor/NSColor` to support the Action Data controls and adds convenience methods for working with colors in a `Codable`, `Encodable` or `Decodable` class.

### The ~= Operator

Sets a `UIColor/NSColor` from a hex string in the format `rrggbb` or `rrggbbaa` where:
     
* `rr` - Specifies the red component as a hex value in the range 00 to FF.
* `gg` - Specifies the green component as a hex value in the range 00 to FF.
* `bb` - Specifies the blue component as a hex value in the range 00 to FF.
* `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
 
The hex string can optionally start with the prefix of `#`.
 
#### Examples:
```swift
// Assign a color from a string in iOS, tvOS or watchOS
let color: UIColor ~= "#FF0000"
 
// Assign a color from a string in macOS
let color: NSColor ~= "#FF0000"
```

### fromHex Initializer

Initializes a `UIColor/NSColor` from a hex string in the format `rrggbb` or `rrggbbaa` where:
     
* `rr` - Specifies the red component as a hex value in the range 00 to FF.
* `gg` - Specifies the green component as a hex value in the range 00 to FF.
* `bb` - Specifies the blue component as a hex value in the range 00 to FF.
* `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
 
The hex string can optionally start with the prefix of `#`.
 
#### Examples:
```swift
// Assign a color from a string in iOS, tvOS or watchOS
let color = UIColor(fromHex: "#FF0000")
 
// Assign a color from a string in macOS
let color = NSColor(fromHex: "#FF0000")
```

### toHex Function

Converts a `UIColor/NSColor` to a hex string in the format `rrggbb` or `rrggbbaa` where:
     
* `rr` - Specifies the red component as a hex value in the range 00 to FF.
* `gg` - Specifies the green component as a hex value in the range 00 to FF.
* `bb` - Specifies the blue component as a hex value in the range 00 to FF.
* `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
 
The hex string can optionally start with the prefix of `#`.
 
#### Examples:
```swift
// Assign a color from a string in iOS, tvOS or watchOS
let colorHex = UIColor.red.toHex();
let colorHexShort = UIColor.red.toHex(withPrefix: false, includeAlpha: false);
 
// Assign a color from a string in macOS
let colorHex = NSColor.red.toHex();
let colorHexShort = NSColor.red.toHex(withPrefix: false, includeAlpha: false);
```

<a name="Data-Extensions"></a>
## Data Extensions

Extends `Data` to support the Action Data controls and adds convenience methods for working with data properties in a `Codable`, `Encodable` or `Decodable` class.

### The ~= Operator

Sets the `Data` instance from the given `UIImage/NSImage` instance.
     
#### Examples:
```swift
// Assign data from an image in iOS, tvOS or watchOS
let imageData: Data ~= UIImage(named: "Background.png")

// Assign data from an image in macOS
let imageData: Data ~= NSImage(named: "Background.png")
```

### The uiImage/nsImage Property

Attempts to create a `UIImage/NSImage` from the data stored in the current `Data` instance. Returns the Image if it can be created else returns `nil`.
     
#### Examples:
```swift
// Assign data from an image in iOS, tvOS or watchOS
let imageData: Data ~= UIImage(named: "Background.png")
if let image = imageData.uiImage {
	...
}

// Assign data from an macOS
let imageData: Data ~= NSImage(named: "Background.png")
if let image = imageData.nsImage {
	...
}
```

<a name="Image-Extensions"></a>
## Image Extensions

Extends `UIImage/NSImage` to support the Action Data controls and adds convenience methods for working with image properties in a `Codable`, `Encodable` or `Decodable` class.

### The ~= Operator

Sets the `UIImage/NSImage` from the given Base 64 encoded `String` instance or Sets the `UIImage/NSImage` from the given `Data` instance.

#### Examples:
```swift
// Assign an image from Base 64 encoded String in iOS, tvOS or watchOS
let imageString = UIImage(named: "Background.png").toString()
let image: UIImage ~= imageString

// Assign an image from Base 64 encoded Data in iOS, tvOS or watchOS
let imageData = UIImage(named: "Background.png").toData()
let image: UIImage ~= imageData

// Assign an image from Base 64 encoded String in macOS
let imageString = NSImage(named: "Background.png").toString()
let image: NSImage ~= imageString

// Assign an image from Base 64 encoded Data in macOS
let imageData = NSImage(named: "Background.png").toData()
let image: NSImage ~= imageData
```

### The toString Function

Converts the `UIImage/NSImage` to a `String` representation encoded in Base 64.
     
#### Examples:
```swift
// Assign an image to Base 64 encoded String in iOS, tvOS or watchOS
let imageString = UIImage(named: "Background.png").toString()

// Assign an image to Base 64 encoded String in macOS
let imageString = NSImage(named: "Background.png").toString()
```

### The toData Function

Converts the `UIImage/NSImage` to a `Data` representation.
     
#### Examples:
```swift
// Assign an image to Base 64 encoded Data in iOS, tvOS or watchOS
let imageData = UIImage(named: "Background.png").toString()

// Assign an image to Base 64 encoded Data in macOS
let imageData = NSImage(named: "Background.png").toString()
```

### The fromString Initializer

Creates a new `UIImage/NSImage` instance from a Base 64 encoded string.
     
#### Examples:
```swift
// Assign an image from Base 64 encoded String in iOS, tvOS or watchOS
let imageString = UIImage(named: "Background.png").toString()
let image = UIImage(fromString: imageString)

// Assign an image from Base 64 encoded String in macOS
let imageString = NSImage(named: "Background.png")
let image = NSImage(fromString: imageString)
```

### The pngData Property (macOS Only)

Returns the image as data in the png format.
     
#### Example:
```swift
// Get png Data from image
let data = NSImage(named: "Background.png").pngData
```

### The jpgData Property (macOS Only)

Returns the image as data in the jpeg format.
     
#### Example:
```swift
// Get jpeg Data from image
let data = NSImage(named: "Background.png").jpgData
```

<a name="String-Extensions"></a>
## String Extensions

Extends `String` to support the Action Data controls and adds convenience methods for working with `UIImage/NSImage` and `UIColor/NSColor` properties in a `Codable`, `Encodable` or `Decodable` class.

### The ~= Operator

Sets the `String` from the given `UIColor/NSColor` where the color is converted to a hex string in the format `#rrggbbaa` or sets the `String` from the given `UIImage/NSImage` where the image is converted to a PNG representation and Base 64 encoded.

#### Examples:
```swift
// Get the hex representation of a color in iOS, tvOS and watchOS.
let hex: String ~= UIColor.white

// Get the Base 64 representation of an image in iOS, tvOS and watchOS.
let hex: String ~= UIImage(named: "Background.png")

// Get the hex representation of a color in macOS.
let hex: String ~= NSColor.white
 
// Get the Base 64 representation of an image in macOS.
let hex: String ~= NSImage(named: "Background.png")
```

### The uiColor/nsColor Property

Attempts to convert the `String` into a `UIColor/NSColor` if it is in the format `rrggbb` or `rrggbbaa` where:
     
* `rr` - Specifies the red component as a hex value in the range 00 to FF.
* `gg` - Specifies the green component as a hex value in the range 00 to FF.
* `bb` - Specifies the blue component as a hex value in the range 00 to FF.
* `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
 
#### Examples:
```swift
// Get the hex representation of a color in iOS, tvOS and watchOS.
let hex: String ~= UIColor.white
let color = hex.uiColor

// Get the hex representation of a color in macOS.
let hex: String ~= NSColor.white
let color = hex.nsColor
```

### The uiImage/nsImage Property

If the `String` contains a Base 64 encoded representation of an image it is returns as a `UIImage/NSImage`, else `nil` is returned.
     
#### Examples:
```swift
// Get the Base 64 representation of an image in iOS, tvOS and watchOS.
let hex: String ~= UIImage(named: "Background.png")
let image = hex.uiImage

// Get the Base 64 representation of an macOS.
let hex: String ~= NSImage(named: "Background.png")
let image = hex.nsImage
```

### The fromColor Initializer

Initializes a `String` instance from a given `UIColor/NSColor` stored in the format `#rrggbbaa` where:
 
* `rr` - Specifies the red component as a hex value in the range 00 to FF.
* `gg` - Specifies the green component as a hex value in the range 00 to FF.
* `bb` - Specifies the blue component as a hex value in the range 00 to FF.
* `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
 
#### Examples:
```swift
// Get the hex representation of a color in iOS, tvOS and watchOS.
let hex = String(fromColor: UIColor.white)

// Get the hex representation of a color in macOS.
let hex = String(fromColor: NSColor.white)
```

### The fromImage Initializer

Initializes a `String` instance from a given `UIImage/NSImage` where the image is converted to a PNG representation and Base 64 encoded.
     
#### Examples:
```swift
// Get the Base 64 representation of an image in iOS, tvOS and watchOS.
let hex = String(fromImage: UIImage(named: "Background.png"))

// Get the Base 64 representation of an image in macOS.
let hex = String(fromImage: NSImage(named: "Background.png"))
```

### The typeName Function

Returns a pretty-printed type name (minus the module name) for the given value.
     
#### Example:
```swift
// Assigns a pretty type name
let name = String.typeName(of: "<module>")
```

### The height Property

Returns the draw height of the string in the given font constrained to the given width.
     
#### Example:
```swift
// Get a string height in iOS, tvOS and watchOS
let font = UIFont.systemFont(ofSize: 34, weight: UIFontWeightThin)
let text = "Hello World"
let height = text.height(withConstrainedWidth: 250, font: font)

// Get a string height in macOS
let font = NSFont.systemFont(ofSize: 34, weight: NSFontWeightThin)
let text = "Hello World"
let height = text.height(withConstrainedWidth: 250, font: font)
```

### The width Property

Returns the draw width of the string in the given font constrained to the given height.
     
#### Example:
```swift
// Get a string height in iOS, tvOS and watchOS
let font = UIFont.systemFont(ofSize: 34, weight: UIFontWeightThin)
let text = "Hello World"
let height = text.width(withConstrainedHeight: 50, font: font)

// Get a string height in macOS
let font = NSFont.systemFont(ofSize: 34, weight: NSFontWeightThin)
let text = "Hello World"
let height = text.width(withConstrainedHeight: 50, font: font)
```

### The bounds Property

Returns the drawing bounds of the string in the given font constrained to the given maximum bounds.
     
#### Example:
```swift
// Get a string height in iOS, tvOS and watchOS
let font = UIFont.systemFont(ofSize: 34, weight: UIFontWeightThin)
let text = "Hello World"
let bounds = text.bounds(withConstrainedSize: GGSize(width: 250, height: 50), font: font)

// Get a string height in iOS, tvOS and watchOS
let font = NSFont.systemFont(ofSize: 34, weight: NSFontWeightThin)
let text = "Hello World"
let bounds = text.bounds(withConstrainedSize: GGSize(width: 250, height: 50), font: font)
```