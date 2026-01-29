// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "SwiftLintPlugin",
    products: [
        .plugin(name: "SwiftLintPlugin", targets: ["SwiftLintPlugin"]),
    ],
    targets: [
        .binaryTarget(
            name: "swiftlint",
            url: "https://github.com/realm/SwiftLint/releases/download/0.63.2/SwiftLintBinary.artifactbundle.zip",
            checksum: "12befab676fc972ffde2ec295d016d53c3a85f64aabd9c7fee0032d681e307e9"
        ),
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool,
            dependencies: ["swiftlint"],
        ),
    ],
)
