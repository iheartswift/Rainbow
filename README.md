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


<br />

# Button Shapes 
<img src="https://iheartswift.s3.amazonaws.com/rainbow/Screenshot+2024-06-17+at+12.32.53%E2%80%AFPM.png" height="200">

<br />

# Button Sizes
<img src="https://iheartswift.s3.amazonaws.com/rainbow/Screenshot+2024-06-17+at+12.37.22%E2%80%AFPM.png" height="120">

<br />

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

<br />

## Sample Projects

Take a look at [Example Projects](https://github.com/iheartswift/Examples) **Rainbow-Button-Examples** to get your projects started.
