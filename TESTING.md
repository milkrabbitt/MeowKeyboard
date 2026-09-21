# Testing

## Public examples

Run `swift test` from this repository. The package is intentionally pure Swift on macOS; UIKit extension code is conditionally compiled and requires an iOS SDK build outside SwiftPM.

## Historical production evaluation

Historical project records describe fixed Chinese-input evaluations, including 819 26-key cases and 277 T9 cases. Those records are historical snapshots, not a new validation of build 50 or of this public package.

## Current limitation

The execution environment used for this repository currently blocks SwiftPM's macOS sandbox setup, so this checkout has not produced a successful `swift test` run here. The source and tests are included for independent execution on a normal macOS/Xcode environment.
