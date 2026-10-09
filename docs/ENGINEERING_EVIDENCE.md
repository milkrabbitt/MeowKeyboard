# Engineering Evidence

| Area | Evidence type | Scope and limitation |
|---|---|---|
| Input composition | Production source inspection, 2026-09-18 | Confirms controller use of composition state and candidate interaction; does not publish implementation. |
| Keyboard Extension | Production source inspection, 2026-09-18 | Confirms `UIInputViewController` and `textDocumentProxy` integration. |
| Local persistence | Production source inspection, 2026-09-18 | Confirms SQLite import and local-learning code paths; not a performance measurement. |
| StoreKit | Production source inspection and historical handoff | Confirms StoreKit 2 boundary and entitlement refresh paths; no live transaction test performed for this repository. |
| Public package | Local SwiftPM/XCTest record, 2026-09-21 | Apple Swift 6.2.4; 5 XCTest tests executed, 5 passed, 0 failed. This supersedes the earlier blocked attempt, and does not validate conditionally excluded UIKit code. |
| Fixed production evaluation | macOS engine reports, 2026-10-04, development 2.6 (55) | 819 26-key and 277 T9 cases unchanged against the recorded baseline. Full metrics and corpus limitations are in [TESTING.md](../TESTING.md); not a new validation of build 50. |
| Typo recovery | Internal synthetic evaluations and diagnostic records, 2026-10-04 | Different 106/90/64-case cohorts are reported separately. Valid-Pinyin typo recovery remains unresolved; rejected isolated prototypes are not production improvements. |
| Production state regressions | Production unit-regression result, 2026-10-04, development 2.6 (55) | Command exited 0; composition, deletion, cancellation and press-state models were checked. Does not establish touch behavior on a phone. |
| Development build and installation | Xcode build/install and main-app launch records, 2026-10-04, 2.6 (55) | Software-keyboard touch acceptance and iPhone latency/memory remain unverified. Main-app launch is not keyboard acceptance. |

This is a sanitized evidence summary. Production source, private corpora, raw logs, device identifiers, and internal file locations are not published. The public package is independent from the commercial engine. See [App Store shipping](../APP_STORE_SHIPPING.md) for the separately scoped release record.
