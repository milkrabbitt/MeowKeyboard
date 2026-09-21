// swift-tools-version: 5.9
import PackageDescription
let package = Package(
    name: "MeowKeyboard",
    platforms: [.macOS(.v13)],
    products: [.library(name: "MeowKeyboardExamples", targets: ["MeowKeyboardExamples"])],
    targets: [
        .target(name: "MeowKeyboardExamples"),
        .testTarget(name: "MeowKeyboardExamplesTests", dependencies: ["MeowKeyboardExamples"])
    ]
)
