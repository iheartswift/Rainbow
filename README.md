# 🌈 Rainbow
Welcome to the Rainbow Library! This library provides a vibrant and customizable set of components to enhance your SwiftUI applications. Rainbow components do their best to be multiplatform by default and support platform native features like haptics, sound on iOS 📱 and focused states on Apple 📺.

![iOS](https://img.shields.io/badge/iOS-17.0+-blue)
![macOS](https://img.shields.io/badge/macOS-14.0+-blue)
![watchOS](https://img.shields.io/badge/watchOS-10.0+-blue)
![tvOS](https://img.shields.io/badge/tvOS-17.0+-blue)
![SwiftPM](https://img.shields.io/badge/SwiftPM-compatible-brightgreen)

<br />

## 📦 Installation

To install the Rainbow library, follow these steps:

1. Open your Xcode project.
2. Select **File** > **Add Packages...** from the menu.
3. In the search field, paste the following URL: **https://github.com/iheartswift/Rainbow.git**
4. Choose the version you want to install. For example, to install version 3.0.3, select: ~> `3.0.3`
5. Click Add Package to integrate Rainbow into your project.

<br />

## Features

| Feature                          | iOS | macOS | tvOS | watchOS |
|----------------------------------|-----|-------|------|---------|
| Buttons                          | ✅  | ✅    | ✅   | ✅      |
| Progress Bars                    | ✅  | ✅    | ✅   | ✅      |
| Progress Bar for ScrollView      | ✅  | ✅    | ✅   | ✅      |
| Cards                            | ✅  | ✅    |      |         |
| Notifications                    | ✅  | ✅    | ✅   | ✅      |
| TextFields                       | ✅  | ✅    | 📣   | 📣      |
| Toggles and Toggle Groups        | ✅  | ✅    |      | ✅      |
| Switches                         | ✅  | ✅    | 📣   | ✅      |
| Sliders                          | 📣  | 📣    | 📣   | 📣      |
| Dropdowns                        | 📣  | 📣    | 📣   | 📣      |
| Modals                           | 📣  | 📣    | 📣   | 📣      |
| Adaptive Colors                  | 📣  | 📣    | 📣   | 📣      |

###### Legend
- ✅: Supported
- 📣: Coming soon

<br />

# Buttons

###### Overview
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
| Primary | <img width="400" alt="Screenshot 2024-06-29 at 10 11 37 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/9d1ee7a6-f4b0-4e6e-be0f-6f2e8941305b">|
| Info | <img width="400" alt="Screenshot 2024-06-29 at 10 10 11 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/e13fce59-6cd8-4798-ab6a-66fd368fb748">|
| Link | <img width="400" alt="Screenshot 2024-07-24 at 7 03 01 PM" src="https://github.com/user-attachments/assets/f7f92488-b6f0-4358-ab79-bd592fdf05ad">|
| Success | <img width="400" alt="Screenshot 2024-06-29 at 10 11 42 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/31448fc9-8884-4203-b105-709998ab5f85">|
| Warning | <img width="400" alt="Screenshot 2024-06-29 at 9 51 38 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/c0dc350a-d20c-4387-8847-a5e7d4c5c544">|
| Danger | <img width="400" alt="Screenshot 2024-06-29 at 9 51 43 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/3eb01faa-0582-46ef-9c60-b152bbf74a7d">|
| Gradient | <img width="400" alt="Screenshot 2024-06-29 at 9 51 50 AM" src="https://github.com/iheartswift/Rainbow/assets/1205894/74c359b0-6ff6-44cb-abf1-3409e0f7ed1b">|
| Rainbow | ![ezgif-2-0308acf325](https://github.com/iheartswift/Rainbow/assets/1205894/850c1714-ad46-4f97-97a4-6aaa53b658e7)| 

### Progress Bars and ScrollView 

You can also attach the progress bar to the RainbowProgressScrollView and it will automatically adjust to reach max progress scrolled to the bottom of your content.

```swift
@State var progress: CGFloat = 0.0

/// Create the progress bar and bind state
RainbowProgressBar(.configure(.rainbow, .rectangle), $progress)
                .frame(height: 20)
            
/// Create the scrollView and bind @State 
RainbowProgressScrollView(progress: $progress) {
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

# Notifications

The notification is a simple colored block meant to draw the attention to the user about something. As such, it can be used as a pinned notification in the corner of the view. That's why it supports the use of the close button.

```swift
import SwiftUI
import Rainbow

struct ContentView: View {
    @State private var isPresented = true

    let notificationText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit lorem ipsum dolor. Pellentesque risus mi, tempus quis placerat ut, porta nec nulla. Vestibulum rhoncus ac ex sit amet fringilla. Nullam gravida purus diam, et dictum felis venenatis efficitur."
    
    var body: some View {
        VStack {
            Text(notificationText)
                .rainbowNotification(configuration: .primary, isPresented: $isPresented)
        }
        .padding()
    }
}
```

| Code | Screenshot |
|------|------------|
| Primary | <img width="1069" alt="Screenshot 2024-07-07 at 1 26 26 PM" src="https://github.com/iheartswift/Rainbow/assets/1205894/121e84cc-c79d-488d-af8e-778cc1a0cf4f"> |
| Link | <img width="1066" alt="Screenshot 2024-07-07 at 1 26 46 PM" src="https://github.com/iheartswift/Rainbow/assets/1205894/b91a8a30-53b4-4db7-96eb-73d3dcce0093"> |
| Info |<img width="1058" alt="Screenshot 2024-07-07 at 1 27 28 PM" src="https://github.com/iheartswift/Rainbow/assets/1205894/2ad6d668-b163-4184-b4ca-7395da1f7535"> |
| Success | <img width="1060" alt="Screenshot 2024-07-07 at 1 28 19 PM" src="https://github.com/iheartswift/Rainbow/assets/1205894/0973b3cb-ee7b-4dfc-bc80-a7c71fc8eb75"> |
| Warning | <img width="1064" alt="Screenshot 2024-07-07 at 1 28 34 PM" src="https://github.com/iheartswift/Rainbow/assets/1205894/578a6e01-a0ad-461a-99ec-d72d5fe5d49d"> |
| Danger | <img width="1064" alt="Screenshot 2024-07-07 at 1 29 09 PM" src="https://github.com/iheartswift/Rainbow/assets/1205894/4ca99ead-20a6-46c1-b93c-9d07e3342207">|


##### RainbowNotification Variations
All light and outlined variations of RainbowNotificationConfiguration are available for use as well.

<br />

# TextFields (Beta)

Introducing RainbowField: A Highly Customizable SwiftUI Component
Welcome to RainbowField, a versatile and highly customizable text field component for SwiftUI! RainbowField offers a wide range of configuration options to tailor its appearance and behavior to your needs. Whether you need a standard text field or a call-to-action (CTA) field, RainbowField has you covered. Below is a comprehensive overview of the configuration options available to help you get the most out of this component.

### Key Features
- Field Style: Choose between default and CTA styles to suit your use case.
- Shape Type: Define the bounding box shape of the field, such as a rounded rectangle.
- Header Options: Add optional headers to provide context or instructions above the field.
- Text Options: Customize the appearance and behavior of the text within the field.
- CTA Options: Integrate call-to-action elements seamlessly within the field.
- Placeholder Text Options: Personalize the placeholder text to guide users effectively.
- Caption Text Options: Add captions below the field for additional information or hints.
- Cursor Options: Modify the cursor's appearance to enhance user experience.
- Clear Button Options: Include clear buttons for quick text deletion, suitable for fields like username, email, and password.
- Icon Options: Add icons to the field for a more intuitive interface.
- State-Based Appearance: Define distinct appearances for idle, focus, valid, and invalid states to provide visual feedback to users.
- Validation Rules: Implement custom validation rules to ensure data integrity.

| TextField Appearance States | Screenshot |
|------|------------|
| Idle | <img width="541" alt="Screenshot 2024-07-23 at 7 43 53 PM" src="https://github.com/user-attachments/assets/1e0311e3-06b8-4167-8ef8-19ae39390720">|
| Focus | <img width="543" alt="Screenshot 2024-07-23 at 7 44 05 PM" src="https://github.com/user-attachments/assets/a82cb250-eb2e-4450-bcc1-dcc940ae5a78"> |
| Invalid | <img width="542" alt="Screenshot 2024-07-23 at 7 44 20 PM" src="https://github.com/user-attachments/assets/7f0cb895-a73a-4925-8066-098dc6843eb5"> |
| Valid | <img width="568" alt="Screenshot 2024-07-23 at 7 44 34 PM" src="https://github.com/user-attachments/assets/f84d1646-d3fc-478b-a5cc-d57d9da7d2fd"> |

###### Beta
The API for this component isn't stable yet, still playing around with ideas :) feel free to chime in!

###### Example

```swift
RainbowField(
    viewModel: RainbowFieldViewModel(
        configuration: RainbowFieldConfiguration.Builder()
            .setHeaderOptions(.init(text: "Image left"))
            .setIconOptions(.init(leftImageSystemName: "phone"))
            .setPlaceholderTextOptions(.init(text: "Enter Phone"))
            .build()
    )
)
```
<br />

# RainbowSwitch

**RainbowSwitch** is a customizable and versatile switch component built with SwiftUI. It allows you to create beautiful and interactive switches with ease. The component is highly configurable, enabling you to tailor its appearance and behavior to fit your app's design and requirements.

### Key Features
- Customizable Colors: Use RainbowSwitchColorTheme to easily set the colors for the switch's on and off states, handle, and borders.
- Shape Options: Choose between capsule and rectangle shapes for the switch.
- Animations: Add smooth animations for state changes with configurable animation options.
- Shadow Effects: Customize the shadow color to match your design.
- Predefined Themes: Utilize predefined color themes for quick and consistent styling.

###### Screenshots / Demo
![ezgif-7-57b72b24fd](https://github.com/user-attachments/assets/47cad0fa-9052-4ec6-a51d-73fe02fb40db)

###### Example

```swift

/// In your view 
@State private var isOn: Bool = false

/// In your views body
RainbowSwitch(configuration: .configure(theme: .primary), isOn: $isOn)

```
<br />
<br />

# RainbowToggle

**RainbowToggle** is a highly customizable and flexible toggle component built with SwiftUI. It provides a wide range of configuration options to create beautiful and interactive toggles that seamlessly fit into your app's design.

### Key Features
- Customizable Colors: Use RainbowToggleColorTheme to easily set the colors for the toggles on and off states.
- Shape Options: Choose between rectangle, circle, roundedRect shapes for the switch.
- Animations: Add smooth animations for state changes with configurable animation options.
- Predefined Themes: Utilize predefined color themes for quick and consistent styling.

###### Screenshots / Demo
![ezgif-7-fe725f02c6](https://github.com/user-attachments/assets/459f06dd-7f41-4e1e-85e6-d4279a6e340a)

###### Example

```swift

/// In your view 
@State private var isToggled = false

/// In your views body
Text("Tap me")
    .rainbowToggle(
        .configure(theme: .primary, imageSystemName: "checkmark"),
        isToggled: $isToggled
    )
```
<br />

### Toggle Groups

**RainbowToggleGroup** can be used to group toggles together and allow for multi-selection

###### Screenshots / Demo
![ezgif-7-04522dd2b5](https://github.com/user-attachments/assets/7bca4196-ca7f-4aa3-a8eb-cff184b1f558)

###### Example

```swift
import SwiftUI
import Rainbow

struct ExampleToggleGroupView: View {
    
    struct ExampleItem: Identifiable, Hashable {
        var id = UUID()
        var name: String
        var description: String
    }
    
    @State private var selectedItems: Set<ExampleItem> = []
    
    private let items = [
        ExampleItem(name: "Option 1", description: "This is some description"),
        ExampleItem(name: "Option 2", description: "This is some description"),
        ExampleItem(name: "Option 3", description: "This is some description")
    ]
    
    var body: some View {
        
        let groupConfiguration = RainbowToggleGroupConfiguration(
            orientation: .vertical,
            spacing: 10,
            toggleConfiguration: .configure(theme: .primary, imageSystemName: "checkmark")
        )
        
        RainbowToggleGroup(
            configuration: groupConfiguration,
            selectedItems: $selectedItems,
            items: items,
            { item in
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        )
        .padding()
    }
}
```
<br />
<br />

# 📺 Youtube (Rainbow Mini Series)

Checkout the new mini series for Rainbow how-tos on Youtube: 
https://www.youtube.com/playlist?list=PLwTsipC5z3HvwEDbgZlSLaoxECgIxK5W0
<br />
<br />
# 👩🏽‍💻 Sample Code
Take a look at [Example Projects](https://github.com/iheartswift/Examples) **RainbowExamples** to get your projects started.
