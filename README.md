# Clean Architecture and MethodChannel

This project aims to demonstrate the implementation of Clean Architecture in Flutter applications, along with a practical use case of MethodChannel to integrate native Android and iOS code.

## MethodChannel
MethodChannel is implemented on the Home screen. In this use case, native Android and iOS APIs are used to retrieve the device's battery level.

The battery level is displayed as a "Power Level" on the Home screen.

To test this feature, I recommend using an Android device (emulator or physical device) or a physical iOS device. This is because iOS simulators do not provide reliable battery level information.

## Advanced Animations
The project includes advanced animations designed to enhance the user experience.
- Fade and Slide animations when displaying the Pokemon list on the Pokémon screen.
- Different page transition animations throughout the application to provide smoother navigation.

## Tests
Tests have been implemented across different layers of the application.
- Domain Use Cases
- Stores
- Widget Tests for Main Screens

## Libraries
Only essential libraries were used to keep the project lightweight and maintainable.
- HTTP
- MobX
- Get_it
- Go_router
- Build_runner
- Mockito
