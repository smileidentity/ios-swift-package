# Smile Identity SPM Wrapper

This is a swift package manager wrapper for the Smile Identity iOS SDK.


## Requirements
- iOS 12 or later
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

### Link `.bundle` file to your project

The `MLKitFaceDetection` module requires `GoogleMVFaceDetectorResources.bundle`. Since the bundle can't be introduced via Swift PM, you need to link to your project manually.

Download `GoogleMVFaceDetectorResources.bundle` from [here](https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/GoogleMVFaceDetectorResources.bundle.zip) add it to your Xcode project and build target.

## Limitation

- Because the pre-built MLKit binary does not support `arm64` architechure for iphonesimulator, this project can only be run on `arm64` for iphoneos and `x86_64` for iphonesimulator.
