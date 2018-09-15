// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "random",
    dependencies: [
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.1.0"),
        .package(url: "https://github.com/eneko/CommandRegistry.git", from: "0.0.1"),
        .package(url: "https://github.com/eneko/Logger.git", from: "0.0.1"),
    ],
    targets: [
        .target(
            name: "random",
            dependencies: ["CommandRegistry", "Logger", "Utility"]),
        .testTarget(
            name: "randomTests",
            dependencies: ["random"]),
    ]
)
