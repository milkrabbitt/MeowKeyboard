# Development checkpoint — November 7, 2026

MeowKeyboard continues private product development from build 61. Ordinary Chinese typing remains below the project’s quality targets. This checkpoint is not a release or an Apple/third-party keyboard superiority claim.

## Input and candidate interaction

Two general next-word defects were repaired: a preceding punctuation/Latin/emoji boundary could suppress valid Chinese-suffix suggestions, and duplicate learned suggestions could consume the unique-result quota. Independent structural acceptance improved from **0/192 to 192/192** boundary cases while **192/192** terminal-boundary controls remained correct. These are suggestion-consistency checks, not semantic Top-1/3/5 accuracy.

The fixed macOS Pinyin **819** and T9 **277** evaluations were rerun: Top-1/3/5 remained **48.72%/60.07%/63.98%** and **62.09%/76.17%/79.78%**. Long abbreviated input, mixed spelling and typo ranking still need substantial improvement.

A separately integrated controller change preserves candidate identity, scroll position and held selection during redundant unchanged-host callbacks. Four frozen failures became **4/4 passes**, with **3 original** and **10 additional** controls passing. This uses an isolated simulator UIKit app with a fake text-document proxy and synthetic control events. It does not establish actual system-extension touch behavior or a BB phone pass. [TESTING.md](../TESTING.md) records scope and Mac timing.

## Theme and sound work

Six native-material cat themes are integrated, with coordinated keycaps, pressed states, keyboard surfaces, toolbars and candidate panels. An isolated UIKit fixture produced 189 frames across the six cats plus the base theme and three component widths. Structural checks passed, including stable input hit bounds and a bounded artwork cache; selected frames were visually reviewed. A later Golden Shaded warmth adjustment has 27 additional layout frames. These are simulator component checks with a fake host, not real Keyboard Extension touch, device orientation or iPad acceptance. The two new repository captures are component-harness renders; the four older actual-extension/app captures retain their original dated scope in [the asset manifest](ASSET_MANIFEST.md).

A combined-input fixture was found to omit production frequency and grammar resources. Its initial candidate quality and performance observations were invalidated as product-path evidence and retained for diagnosis. The corrected fixture requires the actual keyboard resource list and hashes. Its fresh-process base and Orange runs each preserved all three diagnostic input sequences, produced their expected first choices and had no candidate timeout. The rare-character observation disappeared without changing production ranking. The initial corrected replay was unoptimized; an additional optimized component replay and phase-separated timing are documented in [TESTING.md](../TESTING.md). Neither is an independent quality benchmark or physical-device acceptance.

Private recordings have objective DSP candidates. The available tool did not support audio input, so no actual listening, final auditory selection or AI timbre transformation is claimed. Final naming and integration of the four new sounds remain pending. The existing bundled PawClick was exercised in a separate bounded component/input replay; this is not auditory or physical-device validation. Original recordings and production asset source files are not published.

## Development and release boundaries

A persistent bounded queue completed a real coding-worker edit, independent verification and guarded integration. Its paused first attempt was resumed after correcting a missing resource input, and 20 infrastructure checks cover conflict protection, interruption/recovery, budgets and external prerequisite gates. The worker is now stopped at its recorded budget; subsequent interactive-agent work is tracked separately. There is no claim of continuing unattended development.

Local build 2.6.1 (62) completed a full Xcode Release archive, including the main app, extension and resources. Development signing, source/resource correspondence and bundle versions were verified, then the package was installed on the development phone. Read-back confirms version 62. The device lock prevented the attempted main-app launch; software-keyboard acceptance is not inferred from installation. The archive is local and development signed, not an App Store upload or Apple distribution-validation result. Phone candidate latency, combined-load memory, complete theme/device validation and StoreKit integration acceptance remain open. No new App Store upload, review submission, automatic release or commercial-term change is included.
