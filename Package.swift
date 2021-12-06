// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "cmark_gfm_swift",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "cmark_gfm_swift",
            targets: ["cmark_gfm_swift"])
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "cmark_gfm_swift",
            dependencies: ["cmark_gfm"],
            path: "Source",
            exclude: ["cmark_gfm"],
            sources: ["."]
        ),
        .target(
            name: "cmark_gfm",
            path: "Source/cmark_gfm",
            sources: ["."],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include")
            ]
        ),
        .testTarget(
            name: "cmark_gfm_swift_tests",
            dependencies: ["cmark_gfm_swift"],
            path: "cmark_gfm_swiftTests"
        )
    ]
)
