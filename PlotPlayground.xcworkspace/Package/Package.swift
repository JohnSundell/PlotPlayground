// swift-tools-version:5.4

/**
*  PlotPlayground
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

import PackageDescription

let package = Package(
    name: "PlotPlayground",
    products: [
        .library(name: "PlotPlayground", targets: ["PlotPlayground"])
    ],
    dependencies: [
        .package(
            name: "Plot",
            url: "https://github.com/johnsundell/plot.git",
            from: "0.9.0"
        )
    ],
    targets: [
        .target(
            name: "PlotPlayground",
            dependencies: ["Plot"]
        )
    ]
)
