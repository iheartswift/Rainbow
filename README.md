# 🌈 Rainbow
Welcome to the Rainbow UI Library! This library provides a vibrant and customizable set of button configurations to enhance your SwiftUI applications. Whether you need buttons, loaders, or gradients, Rainbow UI has you covered with beautiful and interactive elements.

![iOS](https://img.shields.io/badge/iOS-17.0+-blue)
![macOS](https://img.shields.io/badge/macOS-14.0+-blue)
![watchOS](https://img.shields.io/badge/watchOS-10.0+-blue)
![tvOS](https://img.shields.io/badge/tvOS-17.0+-blue)
![SwiftPM](https://img.shields.io/badge/SwiftPM-compatible-brightgreen)

## 📦 Installation

To install Rainbow UI Library, add the following dependency to your `Package.swift` file:

```swift
.package(url: "https://github.com/iheartswift/Rainbow.git", from: "1.0.4")
```

## Sample Projects

Take a look at [Example Projects](https://github.com/iheartswift/Examples) **Rainbow-Button-Examples** to get your projects started.

## Features

- [x] Completely Customizable
- [x] Rectangle Buttons
- [x] Capsule Buttons
- [x] Cirle Buttons
- [x] RoundedRectangle Buttons
- [x] Sound (iOS, macOS, watchOS)
- [x] Haptics (iOS, watchOS)
- [x] Darkmode (few pre-build configurations support darkmode)   
- [x] Custom borders
- [x] Custom gradients
- [x] Custom loaders
- [x] And More...

## Requirements

* Xcode 15.0+

## Multiplatform

| iOS | macOS | watchOS | tvOS |
|-----|-------|---------|------|
| ![](https://iheartswift.s3.amazonaws.com/rainbow/ezgif-5-971b00b241.gif) | ![](https://iheartswift.s3.amazonaws.com/rainbow/ezgif-5-64aa8c2126.gif) | ![](https://iheartswift.s3.amazonaws.com/rainbow/ezgif-5-ab6a7b0278.gif) | ![](https://iheartswift.s3.amazonaws.com/rainbow/ezgif-5-14bc19d1fc.gif) |

## Starter code

There are two kinds of ways you can implement buttons: 

       1. As a button
       2. As a modifier

### Button
```swift
RainbowButton(action: {
       // sign in the user in
   },
   content: Text("Sign in"),
   configuration: .primary
)
```

### Modifier
```swift
Text("Sign in")
    .rainbowButton(.primary) {
        // sign the user in
    }
```

# Technical Details

At the heart of Rainbow buttons is the **RainbowButtonConfiguration** the configurator for all the wonderful buttons you see in the [examples repository](https://github.com/iheartswift/Examples) and images below. There are many pre-configured button configurations that you can choose from and here are some code samples of how to use them: 

### Circle Buttons

These buttons leverage the `Circle()` shape in SwiftUI and can be built in a variaty of ways as you can see below.

![](https://iheartswift.s3.amazonaws.com/rainbow/Screenshot+2024-06-17+at+10.38.14%E2%80%AFAM.png)

<br />

Using the pre-built configuration, you can make any pre-built button become a circle: 
```swift
Image(systemName: "heart")
    .rainbowButton(.button(.outlined(.primary), .circle)) {
        print("Primary button tapped")
    }
```
<br />

Breaking down the example: 

| SwiftUI                      | Modifier       | Pre-built Function | Configuration       | Shape |
|:-----------------------------|:---------------|:----------------|:--------------------|:------|
| Image(systemName: "heart")   | .rainbowButton | .button         | .outlined(.primary) | .circle |


### Custom 
```swift
struct ContentView: View {
    
    var customConfig: RainbowButtonConfiguration {
        return RainbowButtonConfigurationBuilder()
            .setShape(type: .capsule)
            .setLoader(.rainbow)
            .setBorder(RainbowBorderOptions(
                    colors: [
                        .blue,
                        .yellow,
                        .green,
                        .orange
                    ],
                    width: 5.0,
                    dashPattern: [10]
                )
            )
            .setContentGradient(RainbowGradientOptions(colors: [
                    .blue,
                    .yellow,
                    .green,
                    .orange
                ])
            )
            .setSize(.jumbo)
            .build()
    }
    
    var body: some View {
        Text("Custom Button")
            .rainbowButton(customConfig) {
                // Do something
            }
    }
}
```
