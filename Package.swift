// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "sentry_client_cocoa",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "sentry_client_cocoa",
            targets: ["sentry_client_cocoa"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/getsentry/sentry-cocoa", exact: "8.36.0")
    ],
    targets: [
        .binaryTarget(
            name: "sentry_client_cocoa",
            path: "./sentry_client_cocoa.xcframework"
        ),
        .target(
            name: "WrapperTarget",
            dependencies: [
                .product(name: "Sentry", package: "sentry-cocoa"),
                .target(name: "sentry_client_cocoa")
            ],
            path: "./Sources"
        )
    ]
)
