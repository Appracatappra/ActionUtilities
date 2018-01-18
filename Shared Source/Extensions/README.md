# Action Extensions

**Action Extensions** provide several useful features to common, built-in Cocoa, Cocoa Touch and Swift data types such as converting `UIColor` to/from hex strings (for example `#FF0000`), creating `UIImage` instances from Base64 encoded strings stored in `Data` or `NSData` objects and encoding `UIImages` as Base64 strings or `Data` objects.

The following extensions are available:

* [Color Extensions](#Color-Extensions) - Extends `UIColor` to support the Action Data controls and adds convenience methods for working with colors in a `Codable`, `Encodable` or `Decodable` class.
* [Data Extensions](#Data-Extensions) - Extends `Data` to support the Action Data controls and adds convenience methods for working with data properties in a `Codable`, `Encodable` or `Decodable` class.
* [Image Extensions](#Image-Extensions) - Extends `UIImage` to support the Action Data controls and adds convenience methods for working with image properties in a `Codable`, `Encodable` or `Decodable` class.
* [String Extensions](#String-Extensions) - Extends `String` to support the Action Data controls and adds convenience methods for working with `UIImage` and `UIColor` properties in a `Codable`, `Encodable` or `Decodable` class.

<a name="Color-Extensions"></a>
## Color Extensions

Extends `UIColor` to support the Action Data controls and adds convenience methods for working with colors in a `Codable`, `Encodable` or `Decodable` class.

### Color as Hex String

Because `UIColor` is not `Codable`, it cannot directly be included in a data model object as a property. **Action Extensions** include several helper methods to work with color as a hex string to get around this limitation.

A hex string can be in either the `rrggbb` or `rrggbbaa` formats where:
     
* `rr` - Specifies the red component as a hex value in the range 00 to FF.
* `gg` - Specifies the green component as a hex value in the range 00 to FF.
* `bb` - Specifies the blue component as a hex value in the range 00 to FF.
* `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
 
The hex string can optionally start with the prefix of `#`. 

#### Examples:

```swift
// Assign a color from a string
let color: UIColor ~= "#FF0000"

// Initialize a color from a hex string
let green = UIColor(fromHex: "00FF00")

// Convert color to a hex string
let white = UIColor.white.toHex()
```

<a name="Data-Extensions"></a>
## Data Extensions

Extends `Data` to support the Action Data controls and adds convenience methods for working with data properties in a `Codable`, `Encodable` or `Decodable` class.

### Working with Images

Because `UIImage` is not `Codable`, it cannot directly be included in a data model object as a property. **Action Extensions** include several helper methods to work with images as Base 64 encoded data to get around this limitation.

#### Examples:

```swift
// Assign data from an image
let icon: Data ~= UIImage(named: "Icon.png")

// Convert data to an image
let image = icon.uiImage
```

<a name="Image-Extensions"></a>
## Image Extensions

Extends `UIImage` to support the Action Data controls and adds convenience methods for working with image properties in a `Codable`, `Encodable` or `Decodable` class.

### Working with Images

Because `UIImage` is not `Codable`, it cannot directly be included in a data model object as a property. **Action Extensions** include several helper methods to work with images as Base 64 encoded data to get around this limitation.

#### Examples:

```swift
// Assign data from an image
let icon: Data ~= UIImage(named: "Icon.png")
let icon2 = UIImage(named: "Icon2.png").toData()

// Assign image from data
let image: UIImage ~= icon

// Base 64 encode an image
let base64 = UIImage(named: "Icon.png").toString()

// Assign image from base 64 encoded string
let image2: UIImage ~= base64 

// Initialize an image from a base 64 encoded string
let image3 = UIImage(fromString: base64) 
```

<a name="String-Extensions"></a>
## String Extensions

Extends `String` to support the Action Data controls and adds convenience methods for working with `UIImage` and `UIColor` properties in a `Codable`, `Encodable` or `Decodable` class.

### Color as Hex String

Because `UIColor` is not `Codable`, it cannot directly be included in a data model object as a property. **Action Extensions** include several helper methods to work with color as a hex string to get around this limitation.

A hex string can be in either the `rrggbb` or `rrggbbaa` formats where:
     
* `rr` - Specifies the red component as a hex value in the range 00 to FF.
* `gg` - Specifies the green component as a hex value in the range 00 to FF.
* `bb` - Specifies the blue component as a hex value in the range 00 to FF.
* `aa` - Specifies the alpha component as a hex value in the range 00 to FF.
 
The hex string can optionally start with the prefix of `#`. 

#### Examples:

```swift
// Assign a string from a color
let red: String ~= "FF0000"

// Get a UIColor from a hex string
let uiRed = red.uiColor

// Initialize a string from a color
let white = String(fromColor: UIColor.white)
```

### Working with Images

Because `UIImage` is not `Codable`, it cannot directly be included in a data model object as a property. **Action Extensions** include several helper methods to work with images as Base 64 encoded data to get around this limitation.

#### Examples:

```swift
// Get an image
let icon = UIImage(namde: "Icon.png")

// Assign a string from an image
let base64: String ~= icon

// Get a UIImage from a base 64 encoded string
let myIcon = base64.uiImage

// Initialize a string from an image
let iconString = String(fromImage: icon)
```