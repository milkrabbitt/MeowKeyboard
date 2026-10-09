# Testing

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

Production unit regressions completed with exit code 0, and Xcode completed a full Release build of the main app and extension as 2.6.1 (56). The change also addresses a state-model failure where overlapping letter presses could discard the second input. Device installation and main-app launch of build 56 are confirmed; software-keyboard touch behavior, iPhone latency and extension memory remain unverified. No public Swift example was changed or retested for this documentation update.

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
