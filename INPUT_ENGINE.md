# Chinese Input Engine

The production keyboard supports full Pinyin, Jianpin, mixed Pinyin, and T9. A composition session retains raw input, selected text, and the unconsumed suffix. Candidates carry their own stable identity and consumption range so an asynchronous refresh cannot safely commit a stale display string.

Candidate generation, segmentation, local user-word learning, and ranking are deliberately described only at a design level here. The public package uses tiny invented examples; it does not contain the production scoring formula, lexical database, weights, search limits, or models.
