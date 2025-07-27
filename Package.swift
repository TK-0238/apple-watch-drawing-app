// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "WatchDrawingApp",
    platforms: [
        .iOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(
            name: "WatchDrawingApp",
            targets: ["WatchDrawingApp"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WatchDrawingApp",
            dependencies: []
        ),
    ]
)