# Testing

## Public examples

Run `swift test` from this repository. The package is intentionally pure Swift on macOS; UIKit extension code is conditionally compiled and requires an iOS SDK build outside SwiftPM.

On 2026-09-21, the public package was tested on Apple Swift 6.2.4 with repository-local SwiftPM and module caches. XCTest executed 5 tests: 5 passed, 0 failed. The run covered composition selection, deletion/reset, deterministic candidate deduplication, entitlement expiry/revocation, and pending purchase state.

## Historical production evaluation

Historical project records describe fixed Chinese-input evaluations, including 819 26-key cases and 277 T9 cases. Those records are historical snapshots, not a new validation of build 50 or of this public package.

## Verification boundary

The macOS SwiftPM run does not compile or validate UIKit behavior on iOS, a live keyboard extension, StoreKit sandbox purchases, signing, or real-device interaction. Those remain outside this public package test result.
