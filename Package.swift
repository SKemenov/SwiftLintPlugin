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
            url: "https://github.com/realm/SwiftLint/releases/download/0.65.1/SwiftLintBinary.artifactbundle.zip",
            checksum: "c3a1d77647ca18c1b7e9be7dbc6cd4490d26422f28814b76370244ff61970869"
        ),
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool,
            dependencies: ["swiftlint"],
        ),
    ],
)
