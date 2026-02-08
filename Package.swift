// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Kyoto",
    platforms: [.macOS(.v14)],
    targets: [
        .executableTarget(
            name: "Kyoto",
            path: "Sources/Kyoto"
        )
    ]
)
