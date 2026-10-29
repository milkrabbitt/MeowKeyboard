# Testing

## Cursor-drag development checkpoint — 2026-10-10

Private production development 2.6.1 (57) retains fractional movement between gesture samples, bounds delayed movement, and maps multiple steps to whole grapheme spans. Candidate/preview reconstruction is deferred during the gesture. The input engine and ranking data are unchanged; the fixed 819/277 engine evaluations were not rerun or presented as new results.

The production unit-regression sequence completed with no assertion failures. Its first attempt stopped at a new test fixture's ambiguous Swift array type; after explicitly typing the fixture, the composition and remaining suites passed. Previously completed engine/meowizer suites were not redundantly rerun. Coverage includes positive/negative sampling, residual movement, large jumps without backlog, Unicode boundaries, invalid numeric input, and existing composition, learning and entitlement regressions. These are macOS assertion programs, not a new public-package XCTest run.

Xcode completed a full iOS Release build; both app and extension products report 2.6.1 (57). No build 57 Archive, upload or review submission was made. The device initially appeared disconnected, then reconnected. Xcode installed the existing Release build and its device list confirmed version 57. On 2026-10-10, the user reported some improvement in cursor dragging and provisionally accepted it while still finding it insufficiently smooth. Further cursor tuning is paused; this is not a fully resolved smoothness issue. Host callback timing and typing-load latency/memory remain unverified. The movement cap is a conservative bound, not a phone-calibrated performance claim.

## Additional device observation — 2026-10-10

Instruments attached to the installed build 57 keyboard extension for approximately 16 seconds without a controlled typing workload. The UI Memory readings observed during the run were 41.75 MiB and 41.70 MiB. These are rounded UI observations, not an exported minimum/maximum, a typing peak, or evidence of a leak. A raw trace was saved privately. Numeric export was blocked by an Instruments CLI `Missing features` error after cache permission was granted; no percentile is inferred. The process had already been used and its workload/thermal conditions were not matched to the earlier build 56 idle trace, so these recordings do not establish a version-to-version memory regression. No input-to-candidate latency markers or synchronized touch recording were obtained.

## Public examples

Run `swift test` from this repository. The package is intentionally pure Swift on macOS; UIKit extension code is conditionally compiled and requires an iOS SDK build outside SwiftPM.

On 2026-09-21, the public package was tested on Apple Swift 6.2.4 with repository-local SwiftPM and module caches. XCTest executed 5 tests: 5 passed, 0 failed. The run covered composition selection, deletion/reset, deterministic candidate deduplication, entitlement expiry/revocation, and pending purchase state.

## Production development update — 2026-10-09

The following completed macOS engine evaluation uses the final private source for development version 2.6.1 (56). It is separate from both the public package and version 2.6 (50), whose shipping status is recorded separately.

| Evaluation set | Cases | Build 55 Top-1 / Top-3 / Top-5 | Build 56 Top-1 / Top-3 / Top-5 |
|---|---:|---|---|
| Fixed 26-key evaluation | 819 | 48.72% / 60.07% / 63.61% | 48.72% / 60.07% / 63.98% |
| Fixed T9 evaluation | 277 | 61.01% / 74.73% / 78.34% | 61.01% / 74.73% / 78.34% |
| Existing synthetic typo cohort | 106 | 17.92% / 17.92% / 17.92% | 17.92% / 17.92% / 37.74% |
| New post-freeze synthetic confirmation cohort | 32 | 15.62% / 15.62% / 18.75% | 15.62% / 15.62% / 34.38% |

The 32-case cohort comes from eight newly authored, manually reading-checked sentences. It was frozen after the candidate policy and evaluated without further tuning. It is an internal synthetic holdout, not an external human study. The original first-three candidate lists and previously successful Top-5 targets were retained in the unpersonalized reviewed comparisons; existing local learning can still reorder candidates. Improvement is in candidate coverage, not first-choice accuracy, number of edits, or measured typing success.

For the earlier valid-Pinyin error subsets, the reviewed method recovered 21 of 43 targets in the 106-case cohort and 13 of 24 in the earlier reading-checked cohort. Respectively 22 and 11 remained missing from Top-5. The previously excluded short-boundary cases were still not recovered: relaxing a length boundary alone did not fix the retained segmentation and ranking failures.

### Performance and acceptance boundaries

A same-Mac optimized baseline/reviewed/reviewed/baseline comparison on the 106-case cohort measured:

| Measurement | Baseline | Reviewed implementation |
|---|---:|---:|
| Candidate-query P50 | 24.87–26.43 ms | 30.65–31.62 ms |
| Candidate-query P95 | 53.04–56.25 ms | 55.63–57.25 ms |
| Process peak RSS, decimal | 31.6–31.9 MB | 32.7–33.2 MB |

These are isolated macOS engine measurements of the reviewed implementation, not timings from the installed iOS extension. Added work remains measurable. Correct-input timing had substantial host variation; there is no established general speedup. In the reviewed cancellation probe, 48 of 48 late cancellations returned no candidates, with P95 0.20 ms from the first positive cancellation callback to return. This does not measure a user's touch-to-cancel delay.

Production unit regressions completed with exit code 0, and Xcode completed a full Release build of the main app and extension as 2.6.1 (56). The change also addresses a state-model failure where overlapping letter presses could discard the second input. Device installation and main-app launch of build 56 are confirmed. The limited user-reported interaction checks and separate idle-memory observation below do not establish complete device acceptance or typing performance. No public Swift example was changed or retested for this documentation update.

### iPhone manual checks — user-reported, 2026-10-09

The user reported completing these checks on the installed development build:

- Fast typing, local deletion/re-entry, partial candidate selection and deletion recovery.
- Expanded-candidate scrolling without unintended selection.
- Repeating delete stopped on release; long-press space moved the cursor.
- With `nihao` composing, the confirm key submitted the raw letters only; the host action required a subsequent independent tap.

No functional anomaly was reported in those groups, but the user found space-drag cursor movement insufficiently smooth. These are user-reported manual observations, not recorded tool-operated touch tests or a latency measurement. T9 interaction, full-access-disabled behavior, switching host apps/input fields, and purchase restoration were not confirmed in this check.

### iPhone idle-process trace — 2026-10-09

Instruments Activity Monitor recorded the actual keyboard-extension process for **15.94 seconds**. Exported trace data contained six unequal-duration intervals: **Physical Memory Footprint 9.69–9.88 MiB**, with a **row median of 9.80 MiB**. The row median is not a time-weighted median. Thermal state was **Serious** throughout the recorded intervals.

The software keyboard was not displayed or touched during this separate idle recording. These values describe only this idle window, not typing-load memory, an all-session peak, leak behavior or candidate latency. iPhone candidate latency and memory under typing load remain unmeasured. The thermal condition limits cross-run comparisons. No raw trace, device identifier or user-input data is published.

## Historical production evaluation

**Historical evaluation snapshot — not a new validation of build 50.** The following results come from production development records dated 2026-10-04, for local version 2.6 (55). They are macOS engine evaluations, not public-package XCTest results or iPhone touch measurements. Top-1/3/5 describe the expected target's presence within the corresponding candidate cutoff.

| Evaluation set | Cases | Top-1 | Top-3 | Top-5 |
|---|---:|---:|---:|---:|
| Fixed 26-key evaluation | 819 | 48.72% | 60.07% | 63.61% |
| Fixed T9 evaluation | 277 | 61.01% | 74.73% | 78.34% |
| Additional synthetic typo cohort | 106 | 17.92% | 17.92% | 17.92% |
| Separate nonduplicate extra-character cohort | 90 | 30.00% | 44.44% | 44.44% |
| Manually reading-checked correct-input cohort | 16 | 87.50% | 93.75% | 100.00% |
| Four error types derived from those 16 sentences | 64 | 29.69% | 31.25% | 32.81% |

The 819/277 results were unchanged relative to the recorded baseline. The 106- and 90-case cohorts have different inputs and error distributions: their percentages are not a before/after comparison. The 64-case cohort contains 16 adjacent-key, 16 missing-character, 16 extra-character, and 16 transposition cases; their Top-5 rates were 31.25%, 25.00%, 12.50%, and 62.50%, respectively. These are authored synthetic examples, not external user studies. Some earlier automatically transliterated evaluation inputs were found to have incorrect readings; fixed historical scores retain their original definition for comparability and are not claimed as a clean pronunciation benchmark.

Valid-but-mistyped Pinyin remains unresolved: the expected target was absent from Top-5 for all 43 such cases in the 106-case cohort, and all 24 such cases in the reading-checked 64-case cohort. Isolated competitive-decoding experiments improved some previously observed cases but added latency; the selected prototype did not improve the reading-checked cohort. Those prototypes were not integrated into build 55.

### Performance scope

One optimized macOS engine-only run on the 64-case cohort recorded candidate-query P50 32.02 ms, P95 71.44 ms, and process peak RSS 31.98 MB (decimal). It used a clean process without personalized learning. This is a single internal run, not a repeated device benchmark, a rendering measurement, or a keyboard-extension memory measurement. It cannot establish phone responsiveness or cancellation latency.

### Production regressions and device evidence

The 2026-10-04 production unit-regression command completed with exit code 0 for the unchanged build 55 source. Recorded coverage includes partial selection and deletion recovery, stale-candidate cancellation, literal input casing, return-key press isolation, and space-drag state handling. These model checks do not replace touch testing.

The same development record confirms a complete Xcode build, device installation, and main-app launch for 2.6 (55). Actual software-keyboard touch acceptance, iPhone candidate latency/memory, and host-app interaction remain unverified. That record does not establish device acceptance or StoreKit transaction behavior for the later build 56. The subsequent production build evidence is reported separately above.

## Verification boundary

The macOS SwiftPM run does not compile or validate UIKit behavior on iOS, a live keyboard extension, StoreKit sandbox purchases, signing, or real-device interaction. Those remain outside this public package test result.


## Production membership follow-up — 2026-10-12, development 2.6.1 (58)

- The complete production assertion-regression command exited 0, including input/composition/learning and membership readiness checks. No unchanged fixed-corpus evaluation was rerun.
- Xcode ran **2 XCTest cases, 0 failures, 6.021 seconds** on a physical iPhone using StoreKitTest. Coverage includes product-load timeout/retry, unavailable-product feedback, delayed/background startup presentation, trial eligibility, purchase cancellation/success, pending approval, restoration, restart, cancellation of renewal while still entitled, refund revocation and expiry. These are production tests, separate from the public package's five historical tests.
- The full iOS Release build, device installation and main-app launch passed. Mirroring showed the minimal cold-start membership sheet with the StoreKit-localized annual price. Tapping its purchase action displayed Apple's actual Sandbox confirmation, explicitly marked test-only/no charge. Authentication was handed to the owner, who subsequently confirmed successful Sandbox purchase and membership unlock. This completion is user-reported, not a tool-observed transaction receipt.
- This does not establish a new keyboard touch pass, candidate-latency measurement, typing-load memory benchmark, or real-money purchase test. Cursor tuning remains paused with provisional user acceptance.


## Basic input checkpoint: historical build 59, checked 2026-10-27

These are private production records from 2026-10-12, not a new test run, not public-package XCTest results and not a validation of build 50. On 2026-10-27 the current private source matched its saved build-59 snapshot, and Xcode showed build 59 installed on the connected development iPhone. No unchanged evaluation was rerun.

| Fixed macOS engine set | Cases | Top-1 | Top-3 | Top-5 |
|---|---:|---:|---:|---:|
| 26-key, build 59 | 819 | 48.72% | 60.07% | 63.98% |
| T9, build 59 | 277 | 62.09% | 76.17% | 79.78% |
| T9, saved pre-change baseline | 277 | 61.01% | 74.73% | 78.34% |

The 26-key result was unchanged against the saved pre-change evaluator; T9 lost no previously correct first choices in that comparison. All 8,454 readings in the separate reference-derived reachability corpus were reachable through full Pinyin, T9 and reading-specific T9 paths. This measures access to complete candidate lists, not first-choice accuracy. The owner reported that the previously missing character under `huan` became available on the phone; this is not a full touch-test pass. Daily diagnostic fixtures with two later-discovered contextual pronunciation errors remain provisional and are not used here to claim a quality gain.

The internal Top-1/3/5 targets remain 75%/90%/95% and are not met. Long abbreviated/mixed input and valid-Pinyin typo recovery remain open. Production assertion regressions and the full iOS Release build passed in the dated records. The recorded macOS P95 was approximately 39–41 ms for full Pinyin and 20 ms for T9; these are engine timings, not phone latency. A 24.887-second idle device trace showed Memory 15.80 MiB in the selected process row: this is neither a typing-load peak nor a declared physical footprint. Phone candidate P50/P95, typing-load memory and a controlled Apple-keyboard comparison remain unverified. Cursor tuning remains paused with provisional user acceptance and remaining smoothness limitations.

## Device capture clarification — confirmed 2026-10-29

A separate Activity Monitor capture on 2026-10-27 attached to the live build-59 keyboard extension on an iPhone 15 Pro running iOS 26.7.1. It lasted 109.86 seconds, including idle/waiting time. On 2026-10-29 the owner explicitly confirmed approximately 20 seconds of physical typing, candidate selection and local editing during that capture; the whole recording is not classified as active typing.

The tool-observed **Memory column snapshots** were 22.27, 34.02 and 34.67 MiB. These are not a computed peak, a declared resident-memory metric or a controlled before/after comparison. The raw trace remains private. CLI export failed with `Missing features`, so a complete exported peak/statistical summary is unavailable. Candidate P50/P95 remain unmeasured because this instrument does not provide synchronized touch and candidate-completion events. This clarification is not a new XCTest run, full keyboard acceptance or input-quality improvement.
