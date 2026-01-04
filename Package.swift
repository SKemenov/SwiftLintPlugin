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
            url: "https://github.com/realm/SwiftLint/releases/download/0.63.0/SwiftLintBinary.artifactbundle.zip",
            checksum: "b51ca39ffe2331fe0337f9267d4b0dea2c182791a2fd0f3b961d7cbfb6d488d7"
        ),
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool,
            dependencies: ["swiftlint"],
        ),
    ],
)
