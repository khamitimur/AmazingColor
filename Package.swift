// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AmazingColor",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AmazingColor",
            targets: ["AmazingColor"]),
    ],
    dependencies: [
        .package(url: "https://github.com/khamitimur/AmazingColorHelpers.git", branch: "master")
    ],
    targets: [
        .target(
            name: "AmazingColor",
            dependencies: ["AmazingColorHelpers"]),
        .testTarget(
            name: "AmazingColorTests",
            dependencies: ["AmazingColor"]),
    ]
)
