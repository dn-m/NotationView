// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NotationView",
    products: [
        .library(name: "PlotView", targets: ["PlotView"]),
        .library(name: "StaffView", targets: ["StaffView"]),
        .library(name: "RhythmView", targets: ["RhythmView"])
    ],
    dependencies: [
        .package(url: "https://github.com/dn-m/Graphics", .branch("master")),
        .package(url: "https://github.com/dn-m/NotationModel", from: "0.3.0")
    ],
    targets: [

        // Sources
        .target(name: "PlotView", dependencies: ["PlotModel", "Rendering"]),
        .target(name: "StaffView", dependencies: ["PlotView", "StaffModel"]),
        .target(name: "RhythmView", dependencies: ["Rendering", "SpelledRhythm"]),

        // Tests
        .testTarget(name: "PlotViewTests", dependencies: ["PlotView", "GraphicsTesting"]),
        .testTarget(name: "StaffViewTests", dependencies: ["StaffView"]),
        .testTarget(name: "RhythmViewTests", dependencies: ["RhythmView", "GraphicsTesting"])
    ]
)
