import Foundation

/// Configuration utilities for the SwiftLint plugin.
/// This module provides flags to configure and functions to locate SwiftLint configuration files.

/// An array of command-line flags to pass to SwiftLint for consistent behavior.
public let flags: [String] = [
    "lint",
    "--quiet",
    "--force-exclude",
    "--no-cache",
    "--lenient",
]

/// An array of possible names for SwiftLint configuration files.
private let names: [String] = [
    "swiftlint.yml",
    ".swiftlint.yml",
]

/// Allow search up to four levels of parent directories
private let  maxHierarchyLevel: Int = 4

/// Searches for a SwiftLint configuration file starting from the given URL and moving up the
/// directory tree. The function checks up to `maxHierarchyLevel` of parent directories for configuration
/// files named "swiftlint.yml" or ".swiftlint.yml".
/// 
/// - Parameter url: The initial directory URL to start searching from.
/// - Returns: An array containing "--config" and the path to the found config file, or an empty array
/// if no config is found.
public func findConfig(in url: URL) -> [String] {
    let folders: [URL] = createVariations(for: url)
    let candidates: [URL] = folders.flatMap { dir in names.map { dir.appendingPathComponent($0) } }

    for file in candidates where FileManager.default.fileExists(atPath: file.path) {
        print("[Tools.SwiftLintPlugin]: found config file - \(file.path)")
        return ["--config", file.path]
    }
    print("[Tools.SwiftLintPlugin]: has found no config file, use default rules")
    return []
}

/// Creates a list of directory variations by successively removing the last path component.
/// This allows searching for configuration files up the directory hierarchy.
/// - Parameter url: The starting URL.
/// - Returns: An array of URLs, including the original and up to `maxHierarchyLevel` of parent directories.
private func createVariations(for url: URL) -> [URL] {
    var urls: [URL] = []
    var current = url
    for _ in 0..<maxHierarchyLevel {
        urls.append(current)
        current = current.deletingLastPathComponent()
    }
    return urls
}
