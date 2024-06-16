// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Rainbow",
    platforms: [.iOS(.v17), .macOS(.v10_14)],
    products: [
        .library(
            name: "Rainbow",
            targets: ["Rainbow"]),
    ],
    targets: [
        .target(
            name: "Rainbow",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "RainbowTests",
            dependencies: ["Rainbow"]),
    ]
)
