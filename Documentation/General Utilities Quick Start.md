# General Utilities

**General Utilities** provide several, general utility classes to handle thing such as simple popup notifications.

<a name="ACNotify"></a>
## ACNotify iOS, tvOS and watchOS

Provides a quick, Toast-like popup message that appears at the bottom of the devices screen for 1 second.

### Examples:

```swift
// Showing a message in iOS, tvOS and watchOS.
ACNotify.showMessage(text: "Hello World!")
```

## ACNotify macOS

Displays a simple Toast-like popup notification in the Mac's notification center.
     
## Example:
```swift
// Display popup notification in macOS
ACNotify.showMessage(text: "Hello World!")

// Display popup notification with extra information
ACNotify.showMessage(title: "NOTIFICATION", subtitle: "Sample Notification", text: "Hello World!")
```