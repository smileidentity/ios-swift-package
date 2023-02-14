# Smile Identity SPM Wrapper

This is a swift package manager wrapper for the Smile Identity iOS SDK.


## Requirements
- iOS 13 or later
- Xcode 13.2.1 or later

## Installation

### Use Swift Package Manager to install

```swift
    .package(url: "https://github.com/smileidentity/ios-swift-package", .branch("main"))
```
### Add Linker flags

Add these flags to `Other Linker Flags` in Build Settings of your Xcode projects.

- `-ObjC`
- `-all_load`

### Link `.bundle` to your project

The `MLKitFaceDetection` contains `GoogleMVFaceDetectorResources.bundle`. Since the bundle can't be introduced via Swift PM, you need to link to your project manually.

Download `GoogleMVFaceDetectorResources.bundle` from [Release](https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/GoogleMVFaceDetectorResources.bundle.zip) and add to your Xcode project and make it available in your build target.

## Limitation

- Because the pre-built MLKit binary does not support `arm64` architechure for iphonesimulator, this project enables to build in `arm64` for iphoneos and `x86_64` for iphonesimulator only.
