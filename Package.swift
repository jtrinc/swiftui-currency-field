// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "CurrencyField",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CurrencyField",
            targets: ["CurrencyField"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CurrencyField",
            dependencies: []
        ),
    ]
)
