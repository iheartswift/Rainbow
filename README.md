# 🌈 Rainbow
Welcome to the Rainbow Button Library! This library provides a vibrant and customizable set of button configurations to enhance your SwiftUI applications. Rainbow buttons are multiplatform by default and support platform native features like haptics, sound on iOS 📱 and focused states on Apple 📺.

![iOS](https://img.shields.io/badge/iOS-17.0+-blue)
![macOS](https://img.shields.io/badge/macOS-14.0+-blue)
![watchOS](https://img.shields.io/badge/watchOS-10.0+-blue)
![tvOS](https://img.shields.io/badge/tvOS-17.0+-blue)
![SwiftPM](https://img.shields.io/badge/SwiftPM-compatible-brightgreen)

<br />

## 📦 Installation

To install Rainbow UI Library, add the following dependency to your `Package.swift` file:

```swift
.package(url: "https://github.com/iheartswift/Rainbow.git", from: "1.0.4")
```
<br />

## Features

- [x] Customizable
- [x] Rectangle, Circle, RoundedRectangle, Capsule 
- [x] Sound (iOS, macOS, watchOS)
- [x] Haptics (iOS, watchOS)
- [x] Darkmode (few pre-build configurations support darkmode)   
- [x] Custom borders
- [x] Custom gradients
- [x] Built-in loaders that support @State
- [x] And More...

<br />

## Multiplatform

| iOS | macOS | watchOS | tvOS |
|-----|-------|---------|------|
| ![](https://iheartswift.s3.amazonaws.com/rainbow/ezgif-5-971b00b241.gif) | ![](https://iheartswift.s3.amazonaws.com/rainbow/ezgif-5-64aa8c2126.gif) | ![](https://iheartswift.s3.amazonaws.com/rainbow/ezgif-5-ab6a7b0278.gif) | ![](https://iheartswift.s3.amazonaws.com/rainbow/ezgif-5-14bc19d1fc.gif) |

<br />

# Technical Details

At the ❤️ of Rainbow buttons is the **RainbowButtonConfiguration** the configurator for all the wonderful buttons you see in the [examples repository](https://github.com/iheartswift/Examples) and images below. There are many pre-configured button configurations that you can choose from: 

<br />

## Pre-built configurations

You can try these configurations out in the [examples repository](https://github.com/iheartswift/Examples) in the **Rainbow-Button-Examples** project.

<br />

### Basic Configurations
<img src="https://iheartswift.s3.amazonaws.com/rainbow/Screenshot+2024-06-17+at+11.17.37%E2%80%AFAM.png" height="80">

| Configuration       | Description                                                                                           |
|---------------------|-------------------------------------------------------------------------------------------------------|
| `default`           | The default button configuration with moderate bounce.                                                 |
| `white`             | A pre-defined button configuration with a white theme.                                                 |
| `light`             | A pre-defined button configuration with a light theme.                                                 |
| `dark`              | A pre-defined button configuration with a dark theme.                                                  |
| `black`             | A pre-defined button configuration with a black theme.                                                 |
| `text`              | A pre-defined button configuration with a text theme and underline.                                     |
| `ghost`             | A pre-defined button configuration with a ghost theme.                                                 |

<br />

### Light / Darkmode Configurations
![](https://iheartswift.s3.amazonaws.com/rainbow/ezgif-6-948dd91663.gif)

| Configuration       | Description                                                                                           |
|---------------------|-------------------------------------------------------------------------------------------------------|
| `primary`           | A pre-defined button configuration with a primary theme.                                               |
| `link`              | A pre-defined button configuration with a link theme.                                                  |
| `info`              | A pre-defined button configuration with an info theme.                                                 |
| `success`           | A pre-defined button configuration with a success theme.                                               |
| `warning`           | A pre-defined button configuration with a warning theme.                                               |
| `danger`            | A pre-defined button configuration with a danger theme.                                                |

<br />

### Outlined Configurations

<img src="https://iheartswift.s3.amazonaws.com/rainbow/Screenshot+2024-06-17+at+12.04.52%E2%80%AFPM.png" height="80">
<img src="https://iheartswift.s3.amazonaws.com/rainbow/Screenshot+2024-06-17+at+12.03.58%E2%80%AFPM.png" height="80">

| Configuration       | Description                                                                                           |
|---------------------|-------------------------------------------------------------------------------------------------------|
| `outlined`          | Creates an outlined button configuration with the specified theme.                                      |


<br />

### Inverted Configurations
<img src="https://iheartswift.s3.amazonaws.com/rainbow/Screenshot+2024-06-17+at+12.07.14%E2%80%AFPM.png" height="80">

| Configuration       | Description                                                                                           |
|---------------------|-------------------------------------------------------------------------------------------------------|
| `primaryInverted`   | A pre-defined button configuration with an inverted primary theme and large title font.                |
| `linkInverted`      | A pre-defined button configuration with an inverted link theme.                                        |
| `infoInverted`      | A pre-defined button configuration with an inverted info theme.                                        |
| `successInverted`   | A pre-defined button configuration with an inverted success theme.                                     |
| `warningInverted`   | A pre-defined button configuration with an inverted warning theme.                                     |
| `dangerInverted`    | A pre-defined button configuration with an inverted danger theme.                                      |

<br />

### Light Configurations
<img src="https://iheartswift.s3.amazonaws.com/rainbow/Screenshot+2024-06-17+at+12.09.40%E2%80%AFPM.png" height="80">

| Configuration       | Description                                                                                           |
|---------------------|-------------------------------------------------------------------------------------------------------|
| `primaryLight`      | A pre-defined button configuration with a light primary theme.                                         |
| `linkLight`         | A pre-defined button configuration with a light link theme.                                            |
| `infoLight`         | A pre-defined button configuration with a light info theme.                                            |
| `successLight`      | A pre-defined button configuration with a light success theme.                                         |
| `warningLight`      | A pre-defined button configuration with a light warning theme.                                         |
| `dangerLight`       | A pre-defined button configuration with a light danger theme.                                          |

<br />

### Rainbow (Gradient) Configurations
<img src="https://iheartswift.s3.amazonaws.com/rainbow/Screenshot+2024-06-17+at+12.14.45%E2%80%AFPM.png" height="100">

| Configuration       | Description                                                                                           |
|---------------------|-------------------------------------------------------------------------------------------------------|
| `rainbow`           | Creates a button with a rainbow theme, customizable shape, colors, border width, and animation interval. |

##### Example code
```swift
VStack {
    Image(systemName: "heart")
    Text("iHeartSwift")
}
.font(.largeTitle)
.padding(20)
.rainbowButton(.rainbow(shapeType: .capsule, colors: [
  Color(red: 0.87, green: 0.29, blue: 0.61),
  Color(red: 0.98, green: 0.42, blue: 0.41),
  Color(red: 0.99, green: 0.75, blue: 0.29)
])) {
  // Do something
}
```

<br />

# Button Shapes 
<img src="https://iheartswift.s3.amazonaws.com/rainbow/Screenshot+2024-06-17+at+12.32.53%E2%80%AFPM.png" height="200">

A custom static configuration is available that makes it east to set the shape:
```swift
VStack {
   Image(systemName: "heart")
   Text("Sign in")
}
.padding()
.rainbowButton(.configure(.default, .circle)) {  // Notice the .circle being passed as the shape
 // Do something   
}
```

For custom button implementations the configuration **builder** should be utilized
```swift
RainbowButtonConfigurationBuilder()
     .setShape(type: .circle)
     .build()
```

<br />

# Button Sizes
<img src="https://iheartswift.s3.amazonaws.com/rainbow/Screenshot+2024-06-17+at+12.37.22%E2%80%AFPM.png" height="120">

| Size        | Description                             |
|-------------|-----------------------------------------|
| `small`     | A small size for the button.            |
| `medium`    | A medium size for the button.           |
| `normal`    | A normal size for the button.           |
| `large`     | A large size for the button.            |
| `extraLarge`| An extra large size for the button.     |
| `jumbo`     | A jumbo size for the button.            |

##### Example 
```swift
Text("Small")
    .rainbowButton(.configure(.default, .capsule, .small)) { // Change .small with any size
        print("Primary button tapped")
    }
```

<br />
<br />
## Starter code

There are two kinds of ways you can implement rainbow buttons: 

       1. RainbowButton struct
       2. .rainbowButton modifier

### 1. RainbowButton
```swift
RainbowButton(action: {
       // Do something
}, Text("Sign in"), .configure(.default, .rectangle))
```

### 2. Modifier
```swift
Text("Sign in")
    .rainbowButton(.primary) {
        // Do something
    }
```

<br />

## Sample Projects
Take a look at [Example Projects](https://github.com/iheartswift/Examples) **Rainbow-Button-Examples** to get your projects started.
