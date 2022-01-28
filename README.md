# baetobe

Dating App.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## How to Connect to ADB wirelessly
```shell
adb tcpip 5555 &&
adb shell ip route
// Copy the IP address from the last command
adb connect <IP>
```

## Using Firebase DebugView(Android)
```shell
adb shell setprop debug.firebase.analytics.app com.baetobe.baetobe
adb shell setprop debug.firebase.analytics.app .none.
```


## Enable githooks
```shell
chmod ug+x .githooks/*
git config core.hooksPath .githooks/
```

## Rebuild auto routes
```shell
flutter packages pub run build_runner build --delete-conflicting-outputs
```