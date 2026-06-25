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
            url: "https://github.com/realm/SwiftLint/releases/download/0.64.1/SwiftLintBinary.artifactbundle.zip",
            checksum: "e04529befaa6d3c50d7acdb28cdfa61b3788d99da94a1bfc1132f267a94679b6"
        ),
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool,
            dependencies: ["swiftlint"],
        ),
    ],
)
