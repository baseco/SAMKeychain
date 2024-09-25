// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SSKeychain",
    platforms: [
        .iOS(.v8),          // SPM requires a minimum of iOS 8.0
        .macOS(.v10_10),    // SPM requires a minimum of macOS 10.10
        .tvOS(.v9),         // SPM requires a minimum of tvOS 9.0
        .watchOS(.v2)       // SPM requires a minimum of watchOS 2.0
    ],
    products: [
        // Defines the SAMKeychain library that other packages can depend on
        .library(
            name: "SSKeychain",
            targets: ["SSKeychain"]
        )
    ],
    dependencies: [
        // No external dependencies
    ],
    targets: [
        .target(
            name: "SAMKeychain",
            path: "Sources",
            sources: ["*.{h,m}"],
            resources: [
                .process("../Support/SAMKeychain.bundle")
            ],
            publicHeadersPath: ".",
            linkerSettings: [
                .linkedFramework("Security"),
                .linkedFramework("Foundation")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
