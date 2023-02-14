// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Smile_Identity_SDK",
    platforms: [.iOS(.v13)],

    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Smile_Identity_SDK",
            targets: ["SmileIdentitySDKWrapper", "Smile_Identity_SDK", "MLKitFaceDetection", "MLImage", "MLKitVision", "Common"]),
    ],
    dependencies: [
        .package(url: "https://github.com/google/promises.git", from: "2.1.1"),
        .package(url: "https://github.com/google/GoogleDataTransport.git", from: "9.2.0"),
        .package(url: "https://github.com/google/GoogleUtilities.git", from: "7.7.1"),
        .package(url: "https://github.com/google/gtm-session-fetcher.git", from: "1.7.2"),
        .package(url: "https://github.com/firebase/nanopb.git", .upToNextMinor(from: "2.30909.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: "Smile_Identity_SDK", url: "https://smile-sdks.s3.us-west-2.amazonaws.com/cocoapods/2.1.22/Smile_Identity_SDK.zip", checksum: "d42622c880a9d27c91f51015513a332ecb0b1e5015f64987973ec08f6d2c9403"),
        .binaryTarget(name: "MLImage", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/MLImage.xcframework.zip", checksum: "d360820204628a8d6d9a915d0bd9ed78aec6ed0eeed7c84c1e78bd85909bbe37"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/MLKitCommon.xcframework.zip", checksum: "50e1c24fc66b9a5b0516dccee5a27bca226e4f41f661799fc96873b572b51417"),
        .binaryTarget(name: "MLKitFaceDetection", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/MLKitFaceDetection.xcframework.zip", checksum: "dbdc769316aa27e316a6404ee9cac847265e0ba6a164f680d10aaa192978fdfb"),
        .binaryTarget(name: "MLKitVision", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/MLKitVision.xcframework.zip", checksum: "19acaf1d993c6911bca9684364d47362cd8ff30ee2609f02a5f94d5143e64edb"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/GoogleToolboxForMac.xcframework.zip", checksum: "6f2e01c3fada4c9a92f45cd83374716026cb5aebf4fed1f74bdd3eba9e9d83bc"),
        .binaryTarget(
            name: "GoogleUtilitiesComponents", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/GoogleUtilitiesComponents.xcframework.zip", checksum: "e9b4e629a140234cee5f4da292219c32f3212fc1fce23c773043e10692abb14d"),
        .binaryTarget(name: "Protobuf", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/Protobuf.xcframework.zip", checksum: "e411598ad55b7a74bdec956e67fd7e6b453fcd4267c0f7ccfdfad0952a220cbd"),
        .target(
            name: "Common",
            dependencies: [
                "MLKitCommon",
                "GoogleToolboxForMac",
                "GoogleUtilitiesComponents",
                "Protobuf",
                .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
                .product(name: "GULEnvironment", package: "GoogleUtilities"),
                .product(name: "GULISASwizzler", package: "GoogleUtilities"),
                .product(name: "GULLogger", package: "GoogleUtilities"),
                .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
                .product(name: "GULNSData", package: "GoogleUtilities"),
                .product(name: "GULNetwork", package: "GoogleUtilities"),
                .product(name: "GULReachability", package: "GoogleUtilities"),
                .product(name: "GULUserDefaults", package: "GoogleUtilities"),
                .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
                .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
                .product(name: "nanopb", package: "nanopb"),
                .product(name: "FBLPromises", package: "promises"),
            ]),
        .target(name: "SmileIdentitySDKWrapper",
                dependencies: [
                    "MLKitFaceDetection", "MLImage", "MLKitVision", "Common", "Smile_Identity_SDK"
                ],
                path: "Sources/Smile_Identity_SDK",
                resources: [.process("Assets")]
               ),
        .testTarget(
            name: "Smile_Identity_SDK_Tests",
            dependencies: ["Smile_Identity_SDK"],
            path: "Tests")
    ]
)