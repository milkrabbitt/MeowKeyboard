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

## Development update — 2026-10-09

| Area | Evidence type | Scope and limitation |
|---|---|---|
| Bounded local correction | Completed private-source macOS evaluation, 2.6.1 (56) | Fixed 819/277 checks and existing 106/new 32 synthetic typo cohorts completed; Top-5 improvements are reported in [TESTING.md](../TESTING.md). First-choice accuracy remains unchanged on the typo cohorts. |
| Input-state recovery | Production unit-regression result, 2.6.1 (56) | Exit code 0; overlapping letter-keypress loss addressed at state-model level. Does not establish phone touch behavior. |
| Performance | Reviewed-source Mac comparison and cancellation probe | Added P50 work and RSS are reported, with timing variation and platform boundaries. No iPhone latency or extension-memory measurement. |
| Full application build and validation | Xcode Release, device and distribution records, 2.6.1 (56) | Main app and extension built; device installation/main-app launch, Archive and distribution validation confirmed. No build 56 upload or version association yet; keyboard touch and phone performance remain unverified. |
| Shipping | App Store Connect status and US public storefront inspection | 2.6 (50) Ready for Distribution and available on the US App Store. Other storefront availability is not inferred. New 2.6.1 is a draft, not an approved or released update. |

This is a sanitized evidence summary. Production source, private corpora, raw logs, device identifiers, and internal file locations are not published. The public package is independent from the commercial engine. See [App Store shipping](../APP_STORE_SHIPPING.md) for the separately scoped release record.
