# Chinese Input Engine

The production keyboard supports full Pinyin, Jianpin, mixed Pinyin, and T9. A composition session retains raw input, selected text, and the unconsumed suffix. Candidates carry their own stable identity and consumption range so an asynchronous refresh cannot safely commit a stale display string.

Candidate generation, segmentation, local user-word learning, and ranking are deliberately described only at a design level here. The public package uses tiny invented examples; it does not contain the production scoring formula, lexical database, weights, search limits, or models.

## Current input-experience development — 2026-10-09

Development version 2.6.1 (56) allows bounded local correction alternatives to compete even when a mistyped string is valid Pinyin. It reuses an existing interpretation and scores local lexical replacements instead of decoding every alternate complete sentence. The repair stage preserves the original first three candidates before existing local-personalization ordering; literal submission remains available. The implementation, lexical data, scoring details and limits remain private.

This approach improves Top-5 coverage on the existing synthetic typo cohort and a separately frozen internal confirmation cohort, without improving Top-1/Top-3 on those sets. It still misses many valid-Pinyin errors, particularly where useful boundaries are absent from the retained interpretation or a local replacement cannot express the target. It does not solve general sentence correction, and it adds measurable computation. See [TESTING.md](TESTING.md) for paired results and platform limits.

The input-state work also fixes a modeled case where overlapping letter presses dropped a valid second key. That state regression is distinct from engine accuracy, and neither model checks nor a successful Release build substitute for real software-keyboard touch acceptance.

## Historical input-experience record — 2026-10-04

As recorded on 2026-10-04, local development build 2.6 (55) includes bounded recovery for some adjacent-key substitutions, missing or extra characters, transpositions, and misplaced separators. Correct-input interpretations and literal input submission remain important constraints; syntactically valid Pinyin is not proof that the user typed what they intended.

The remaining failure is not a single ranking issue. An internal diagnostic cohort contained 43 mistyped strings that were still valid Pinyin, with no expected target in the first five candidates. The normal correction trigger skipped these strings. In a diagnostic-only pass, a length boundary also excluded some recoverable spellings; among the remaining spellings, selection of the repair hypothesis was another bottleneck. Supplying the known correct spelling recovered most targets, but this oracle diagnostic is not a usable correction result.

A separate, manually reading-checked synthetic set reproduced the limitation: all 24 valid-Pinyin typo cases missed their target in the first five candidates. Broader competitive decoding and a syllable-association ranking experiment were kept isolated: their added latency or lack of generalization did not justify integration. No production weights, search parameters, corpora, or experimental implementation are included here.

The development approach is to distinguish trigger, spelling generation, retrieval, and ranking failures; check paired correct inputs for unwanted changes; and evaluate quality together with bounded computation. Current results and their limitations are documented in [TESTING.md](TESTING.md). They do not establish parity with the Apple keyboard or validate real-device touch interaction.
