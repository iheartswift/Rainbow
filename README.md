# 🌈 Rainbow
Welcome to the Rainbow Library! This library provides a vibrant and customizable set of components to enhance your SwiftUI applications. Rainbow components do their best to be multiplatform by default and support platform native features like haptics, sound on iOS 📱 and focused states on Apple 📺.

![iOS](https://img.shields.io/badge/iOS-17.0+-blue)
![macOS](https://img.shields.io/badge/macOS-14.0+-blue)
![watchOS](https://img.shields.io/badge/watchOS-10.0+-blue)
![tvOS](https://img.shields.io/badge/tvOS-17.0+-blue)
![SwiftPM](https://img.shields.io/badge/SwiftPM-compatible-brightgreen)

<br />

<video src="[https://github.com/rayytsn9/ROBOTT/assets/79029536/62f541aa-aa8c-43f5-9ead-4b7a2e0d7c2a](https://iheartswift.s3.amazonaws.com/ads/github-intro.mov)" width="600" />

<br />

## 📦 Installation

To install Rainbow Library, add the following dependency to your `Package.swift` file:

```swift
.package(url: "https://github.com/iheartswift/Rainbow.git", from: "2.0.1")
```
<br />

## Features

- [x] Customizable and pre-configured multiplatform buttons (iOS, macOS, tvOS, watchOS)
- [x] Customizable and pre-configured multiplatform progress bars (iOS, macOS, tvOS, watchOS)
- [x] Customizable multiplatform cards (iOS, macOS)

<br />

# Buttons

At the ❤️ of rainbow buttons is the `RainbowButtonConfiguration`. All of the pre-configured buttons below are made with this object and you can use it and it's builder when you need to take control of your own buttons. 

<br />

## Buttons are multiplatform by default

| iOS | macOS | watchOS | tvOS |
|-----|-------|---------|------|
| ![](https://iheartswift.s3.amazonaws.com/rainbow/ezgif-5-971b00b241.gif) | ![](https://iheartswift.s3.amazonaws.com/rainbow/ezgif-5-64aa8c2126.gif) | ![](https://iheartswift.s3.amazonaws.com/rainbow/ezgif-5-ab6a7b0278.gif) | ![](https://iheartswift.s3.amazonaws.com/rainbow/ezgif-5-14bc19d1fc.gif) |

<br />

## Pre-built Button configurations

See the table below for all the different kinds of pre-built button configurations. 

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

## Button Shapes 
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
RainbowButtonConfiguration.Builder()
     .setShape(type: .circle)
     .build()
```

<br />

## Button Sizes
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

## Additional Information about Buttons

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

# Progress Bars

Progress bars are simple to initialize and support all the same pre-configurations as Button except for outline and inverted.

```swift
/// Track the progress state
@State var progress: CGFloat = 0.0

/// Bind it to the progress bar
RainbowProgressBar(.configure(.primary, .capsule), $progress)
            .frame(height: 20)
```

| Code | Screenshot |
|------|------------|
| Primary | <img width="390" alt="Screenshot 2024-06-29 at 10 11 37 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/9d1ee7a6-f4b0-4e6e-be0f-6f2e8941305b">|
| Info | <img width="390" alt="Screenshot 2024-06-29 at 10 10 11 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/e13fce59-6cd8-4798-ab6a-66fd368fb748">|
| Link | <img width="390" alt="Screenshot 2024-06-29 at 10 10 11 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/0d1bcf77-23c9-4146-9d2f-30a3ea6da182">|
| Success | <img width="388" alt="Screenshot 2024-06-29 at 10 11 42 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/31448fc9-8884-4203-b105-709998ab5f85">|
| Warning | <img width="383" alt="Screenshot 2024-06-29 at 9 51 38 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/c0dc350a-d20c-4387-8847-a5e7d4c5c544">|
| Danger | <img width="385" alt="Screenshot 2024-06-29 at 9 51 43 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/3eb01faa-0582-46ef-9c60-b152bbf74a7d">|
| Gradient | <img width="383" alt="Screenshot 2024-06-29 at 9 51 50 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/74c359b0-6ff6-44cb-abf1-3409e0f7ed1b">|
| Rainbow | ![ezgif-2-0308acf325](https://github.com/iheartswift/Rainbow/assets/1205894/850c1714-ad46-4f97-97a4-6aaa53b658e7)| 

### Progress Bars and ScrollView 

You can also attach the progress bar to the RainbowProgressScrollView and it will automatically adjust to reach max progress scrolled to the bottom of your content.

```swift
@State var progress: CGFloat = 0.0

/// Create the progress bar and bind state
RainbowProgressBar(.configure(.rainbow, .rectangle), $progress)
                .frame(height: 20)
            
/// Create the scrollView and bind @State 
RainbowScrollProgressView(progress: $progress) {
   // scrollView stuff
} 
```

![ezgif-2-4fbbee0953](https://github.com/iheartswift/Rainbow/assets/1205894/741c6cf3-9b1a-4b69-a4fc-6e03ce12f9ff)

<br />

# Cards

Cards are highly configurable and support a few cool features out the box like auto-playing video and loading images from a network.

```swift
/// The most basic kind of card
RainbowCard(headerContent: RainbowCardHeader(title: "Card title"))
```

| Code | Screenshot |
|------|------------|
| Header | <img width="399" alt="Screenshot 2024-06-29 at 9 55 28 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/06e8d5f2-c9f5-4410-8a76-999b97b75b1e"><tr></tr>|
| Header + Button | <img width="401" alt="Screenshot 2024-06-29 at 9 55 35 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/6de5eb96-2120-49b3-b7cf-10fcea44f1c4">|
| Header + (Button + Image) | <img width="399" alt="Screenshot 2024-06-29 at 9 55 42 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/11d30ee6-9e11-46c1-ae51-cecf7d2fbb9b"> |
| Header + Media + Content |  <img width="403" alt="Screenshot 2024-06-29 at 9 55 54 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/3f46ea98-752a-4db7-8544-221554eccbce"> |
| Custom Media + Content | <img width="403" alt="Screenshot 2024-06-29 at 9 57 04 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/f989f494-a189-41c9-9456-ef4ea57bcf0a"> |
| Media + Overlay | <img width="402" alt="Screenshot 2024-06-29 at 9 57 11 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/0074fc95-8858-4f6c-94cc-4276d1658937"> |
| Media + Overlay + Footer | <img width="405" alt="Screenshot 2024-06-29 at 10 40 37 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/40e5041c-7927-44b1-9336-ac7b9e094d88">|


## Sample Code
Take a look at [Example Projects](https://github.com/iheartswift/Examples) **RainbowExamples** to get your projects started.
