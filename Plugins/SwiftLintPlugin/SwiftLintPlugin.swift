import PackagePlugin
//import class Foundation.ProcessInfo

// MARK: - SPM package targets
@main
struct SwiftLintPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        // ONLY RUN FOR DEBUG CONFIGURATION
        // now it doesn't work cause environment is empty
//        guard ProcessInfo.processInfo.environment["CONFIGURATION"] != "Release" else {
//            print("[Tools.SwiftLintPlugin]: Skipping linting in Release build")
//            return []
//        }

        let tool = try context.tool(named: "swiftlint")
        let config = findConfig(in: context.package.directoryURL)

        return [
            .prebuildCommand(
                displayName: "SwiftLint Package Plugin on \(target.name)",
                executable: tool.url,
                arguments: flags + [target.directoryURL.relativePath] + config,
                outputFilesDirectory: context.pluginWorkDirectoryURL
            )
        ]
    }
}

// MARK: - Xcode project targets

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension SwiftLintPlugin: XcodeBuildToolPlugin {
    func createBuildCommands(
        context: XcodeProjectPlugin.XcodePluginContext, target: XcodeProjectPlugin.XcodeTarget
    ) throws -> [PackagePlugin.Command] {
//        guard ProcessInfo.processInfo.environment["CONFIGURATION"] != "Release" else {
//            print("[Tools.SwiftLintPlugin]: Skipping linting in Release build")
//            return []
//        }
//
        let tool = try context.tool(named: "swiftlint")
        let config = findConfig(in: context.xcodeProject.directoryURL)

        return [
            .prebuildCommand(
                displayName: "SwiftLint Xcode Target Plugin on \(target.displayName)",
                executable: tool.url,
                arguments: flags + [context.xcodeProject.directoryURL.relativePath] + config,
                outputFilesDirectory: context.pluginWorkDirectoryURL
            ),
        ]
    }
}
#endif
