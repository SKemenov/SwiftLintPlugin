# SwiftLint Plugin Package

A Swift package that integrates SwiftLint as a build tool plugin.
It downloads the SwiftLint binary from the official GitHub releases and provides a build tool plugin to automatically 
lint Swift source code during the pre-build process.

## Features

- Use your custom SwiftLint rules tailored to your project's needs.
- Easy integration with Xcode project targets.
- Easy integration with Swift Package Manager (SPM).
- Built on the original SwiftLint binary version **0.63.2**.


## Installation

### Swift Package Manager

To get started with this package, simply add it as a local or remote package. You can also configure SwiftLint to work 
with Xcode project targets, SPM packages, or both.


## Setup

### :package: Use SwiftLint with SPM packages

To use this package with SPM packages, add it as a package dependency and then add it as a target plugin.
Please verify the correct path from your package to the `SwiftLintPlugin` package. In my case, it was placed in 
a separate `Tools` folder.

```swift
products: [
    .library(name: "AppNetwork", targets: ["AppNetwork"]),
],
dependencies: [
    .package(path: "../../Tools/SwiftLintPlugin"),
],
targets: [
    .target(
        name: "AppNetwork",
        dependencies: [],
        plugins: [.plugin(name: "SwiftLintPlugin", package: "SwiftLintPlugin")]
    ),
]
```


### :hammer: Use SwiftLint with Xcode project targets

To use this package with Xcode project targets, select the project file, choose the appropriate target,
and then add this package to the `Build Phases` tab under the `Run Build Tool Plug-ins` section.


### Use SwiftLint with project targets and packages

Repeat these steps for each project target or package where you need to use SwiftLint.


## Configuration

The best way to use SwiftLint configuration files is to have only one file and place it in the project root folder. 
If you need custom configuration files for some packages, just place them in the root folder of those packages; 
the plugin will use it first.

Configuration files are usually named `.swiftlint.yml` or `swiftlint.yml`. 

The plugin is trying to find the first configuration file starting from the package/target folder and going up 
to four levels of parent folders.


These settings can be modified in the `Config.swift` file.


Checking Realm SwiftLint for the latest versions is a personal choice.
The package is configured to use the current SwiftLint version, as indicated in the binary target URL and checksum. 
To upgrade to a newer version of SwiftLint, you can manually update the URL and checksum in the binaryTarget property. 
Additionally, refer to the SwiftLint release notes for the appropriate artifact bundle filename and checksum.


## Conclusion

> [!IMPORTANT]
> In the original Realm SwiftLint package.swift file (at the end of it) you may find correct binary file name
and checksum. Update this package binaryTarget manually with the new SwiftLint release from here: https://github.com/realm/SwiftLint


