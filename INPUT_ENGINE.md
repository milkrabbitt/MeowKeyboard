# Chinese Input Engine

The production keyboard supports full Pinyin, Jianpin, mixed Pinyin, and T9. A composition session retains raw input, selected text, and the unconsumed suffix. Candidates carry their own stable identity and consumption range so an asynchronous refresh cannot safely commit a stale display string.

Candidate generation, segmentation, local user-word learning, and ranking are deliberately described only at a design level here. The public package uses tiny invented examples; it does not contain the production scoring formula, lexical database, weights, search limits, or models.

## Input-experience development record

As recorded on 2026-10-04, local development build 2.6 (55) includes bounded recovery for some adjacent-key substitutions, missing or extra characters, transpositions, and misplaced separators. Correct-input interpretations and literal input submission remain important constraints; syntactically valid Pinyin is not proof that the user typed what they intended.

The remaining failure is not a single ranking issue. An internal diagnostic cohort contained 43 mistyped strings that were still valid Pinyin, with no expected target in the first five candidates. The normal correction trigger skipped these strings. In a diagnostic-only pass, a length boundary also excluded some recoverable spellings; among the remaining spellings, selection of the repair hypothesis was another bottleneck. Supplying the known correct spelling recovered most targets, but this oracle diagnostic is not a usable correction result.

A separate, manually reading-checked synthetic set reproduced the limitation: all 24 valid-Pinyin typo cases missed their target in the first five candidates. Broader competitive decoding and a syllable-association ranking experiment were kept isolated: their added latency or lack of generalization did not justify integration. No production weights, search parameters, corpora, or experimental implementation are included here.

The development approach is to distinguish trigger, spelling generation, retrieval, and ranking failures; check paired correct inputs for unwanted changes; and evaluate quality together with bounded computation. Current results and their limitations are documented in [TESTING.md](TESTING.md). They do not establish parity with the Apple keyboard or validate real-device touch interaction.
