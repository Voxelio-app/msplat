// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Msplat",
    platforms: [
        .iOS(.v18),
    ],
    products: [
        .library(name: "Msplat", targets: ["Msplat"]),
    ],
    targets: [
        .target(
            name: "MsplatCore",
            path: "Sources/MsplatCore",
            exclude: ["vendor/licenses"],
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("internal/include"),
                .headerSearchPath("metal"),
                .headerSearchPath("vendor/nlohmann/single_include"),
                .headerSearchPath("vendor/nanoflann/include"),
                .define("USE_MPS"),
                .unsafeFlags(["-fno-objc-arc"]),
            ],
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework("Metal"),
                .linkedFramework("MetalKit"),
                .linkedFramework("MetalPerformanceShaders"),
                .linkedFramework("ImageIO"),
                .linkedFramework("CoreGraphics"),
                .linkedLibrary("c++"),
            ]
        ),
        .target(
            name: "Msplat",
            dependencies: ["MsplatCore"],
            path: "Sources/Msplat",
            resources: [.process("Resources")]
        ),
    ],
    cxxLanguageStandard: .cxx17
)
