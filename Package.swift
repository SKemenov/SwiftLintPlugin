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
            url: "https://github.com/realm/SwiftLint/releases/download/0.65.0/SwiftLintBinary.artifactbundle.zip",
            checksum: "eb333bd76dfb5f46d21fdf3615fe39bb938956ca0b8e94c241c4b2db6e696b90"
        ),
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool,
            dependencies: ["swiftlint"],
        ),
    ],
)
