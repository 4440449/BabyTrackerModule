// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BabyTrackerModule",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BabyTrackerModule",
            targets: ["BabyTrackerModule"]),
    ],
    dependencies: [
        .package(name: "BabyNet",
                 url: "https://github.com/4440449/BabyNet.git",
                 .branch("master")),
        .package(name: "MommysEye",
                 url: "https://github.com/4440449/MommysEye.git",
                 branch: ("master"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BabyTrackerModule",
            dependencies: ["BabyNet", "MommysEye"],
            resources: [.process("PresentationLayer/Scenes/BabyTrackerWW.storyboard"),
                        .process("DataLayer/Infrastructure/LocalStorage/CoreData/Entities/Baby_tracker.xcdatamodeld")]
        ),
        .testTarget(
            name: "BabyTrackerModuleTests",
            dependencies: ["BabyTrackerModule"]),
    ]
)
