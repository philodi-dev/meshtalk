// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "MeshTalk",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "MeshTalk",
            targets: ["MeshTalk"]
        ),
    ],
    targets: [
        .executableTarget(
            name: "MeshTalk",
            path: "MeshTalk"
        ),
    ],
    authors: [
        "Philodi <me@philodi.com>"
    ]
)