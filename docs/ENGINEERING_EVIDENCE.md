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
| Performance | Reviewed-source Mac comparison and cancellation probe | Added P50 work and RSS are reported, with timing variation and platform boundaries. No iPhone candidate-latency or typing-load memory measurement. |
| iPhone idle memory | Exported Instruments Activity Monitor trace, 2026-10-09 | Actual extension process, 15.94-second idle window: Physical Memory Footprint 9.69–9.88 MiB; six unequal-duration rows, row median 9.80 MiB. Serious thermal state. No software-keyboard display or touch during this recording. |
| iPhone interaction | User-reported manual checks, 2026-10-09 | Four groups covered editing/selection, expanded-candidate scrolling, repeating delete/cursor drag, and raw confirmation followed by an independent host action. Cursor-drag smoothness remains a concern. T9, full-access-disabled, host/input-field switching and restore-purchase checks were not confirmed. |
| Full application build and validation | Xcode Release, device and distribution records, 2.6.1 (56) | Main app and extension built; device installation/main-app launch, Archive and distribution validation confirmed. Build 56 upload, Apple processing and saved version-draft association were confirmed on 2026-10-09; it has not been submitted for review. Limited user-reported touch checks and an idle-memory trace are separate from full device acceptance and typing-performance measurement. |
| Shipping | App Store Connect status and US public storefront inspection | 2.6 (50) Ready for Distribution and available on the US App Store. Other storefront availability is not inferred. New 2.6.1 is a draft, not an approved or released update. |

This is a sanitized evidence summary. Production source, private corpora, raw logs, device identifiers, and internal file locations are not published. The public package is independent from the commercial engine. See [App Store shipping](../APP_STORE_SHIPPING.md) for the separately scoped release record.

## Cursor-drag follow-up — 2026-10-10

- Source inspection found sample-dependent discarded travel and repeated candidate-row rebuilding during cursor movement.
- Local development build 57 preserves sub-step travel, bounds delayed jumps and converts movement through whole graphemes. UI refresh is deferred until gesture completion or cancellation; document/selection changes still cancel the gesture.
- Production assertion regressions and the full iOS Release build passed after a test-fixture type correction. This is not evidence of phone smoothness or a new public XCTest run.
- After the device reconnected, Xcode installed build 57 and its device list confirmed the version. The user reports some improvement in cursor dragging and provisionally accepts it, with remaining smoothness limitations; further cursor tuning is paused. A short uncontrolled-workload device memory observation is scoped in TESTING.md. No candidate-latency, engine-quality or new App Store upload result is claimed.

## Release checkpoint — 2026-10-12

The unchanged build 57 source was checked against its recorded source snapshot. A complete Release Archive and App Store distribution validation passed. Upload succeeded without errors, and App Store Connect shows build 57 ready to submit after processing. Build 57 selection in the 2.6.1 draft was saved and confirmed after reloading. Updated release/review notes are saved and manual release remains selected. No review submission or release was performed. Xcode confirms the connected development phone has build 57 installed; this is not a new touch test or phone-performance result.


## Membership repair checkpoint — 2026-10-12

| Area | Evidence | Limitation |
|---|---|---|
| Startup and product availability | Private-source changes and full assertion regressions, development 2.6.1 (58) | No change to product type, price or entitlements; no input-engine changes. |
| StoreKit lifecycle | Xcode StoreKitTest on a physical iPhone: 2 XCTest cases, 0 failures | Test-only transactions, not production billing or a new public-package test. |
| Native purchase entry | Actual device mirroring: minimal cold-start sheet and Apple Sandbox confirmation displayed | The owner confirmed successful Sandbox purchase and unlock; completion is user-reported, not a tool-observed receipt. |
| Build and distribution | Full Release build, device installation, Archive and distribution validation passed | Upload succeeded without errors; Apple processing is complete and build 58 is ready to submit; build 58 is selected in the saved 2.6.1 draft and was confirmed after reloading. Manual release is retained. No review submission or release. |


## Basic input and release separation — checked 2026-10-27

- Current private source matches the saved local build-59 manifest. Xcode independently lists the connected development phone with build 59 installed. No new input-engine change, build or test run is claimed.
- Historical 2026-10-12 records separate complete single-character reading reachability from ranking quality. Fixed-set figures and the unresolved quality target are reported in TESTING.md. Rejected all-reading sentence-pool and forced single-character-priority experiments were not merged.
- The owner reported the missing `huan` character is now reachable on the phone. Full editing acceptance, controlled native-keyboard comparison and phone performance remain unverified. Idle process Memory is not relabeled as typing-load peak or candidate latency.
- Backend version 2.6 remains Ready for Distribution; the unsubmitted 2.6.1 draft selects build 58. Local build 59 is not an uploaded release. Compliance application submission is not approval or regional storefront availability. No private filing materials or identifiers are included.


## Public storefront follow-up — 2026-10-27

A refreshed App Store Connect availability row shows China mainland Available. Apple’s public lookup returns the existing app and version 2.6 in both China mainland and the US. This is a public-listing observation, separate from installing the app on a mainland-storefront device and from releasing development build 59. No new keyboard test or release is implied.

## Follow-up — 2026-10-29

- Apple's public lookup again confirms version 2.6 listed in China mainland and the US; this is not an authenticated draft-status check.
- The owner confirmed approximately 20 seconds of physical input within the 2026-10-27 build-59 device capture. The Memory column snapshots and export/latency limits are documented in [TESTING.md](../TESTING.md); no peak, latency target or optimization gain is inferred.
