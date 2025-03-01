// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPython",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftPython",
            targets: ["SwiftPython"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pvieito/PythonKit.git", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftPython",
            dependencies: ["PythonBridge"]
        ),
        .testTarget(
            name: "SwiftPythonTests"
        ),
        .target(
            name: "PythonBridge",
            dependencies: [
                "PythonFramework",
                .product(name: "PythonKit", package: "pythonkit")    
            ],
            
            path: "Sources/PythonBridge",
            publicHeadersPath: "include"
        ),
        .binaryTarget(
            name: "PythonFramework",
            url: "https://github.com/RealLast/SwiftPython/releases/download/v0.0.1/Python.xcframework.zip",
            checksum: "f94956cdfab8002a7db9c0e398f1268fb9f1002e74d717290982a5055f78ecf6"
        ),
    ]
)

