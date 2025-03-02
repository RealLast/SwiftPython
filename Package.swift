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
            url: "https://github.com/RealLast/SwiftPython/releases/download/v0.9/Python.xcframework.zip",
            checksum: "dadedc75985f60f803fa0077ed26bb15ca102de6c8628163735a83a57ef95839"
        ),
    ]
)

