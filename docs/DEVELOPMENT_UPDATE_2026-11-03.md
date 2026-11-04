# November 3 development update

Local development build 2.6.1 (60) focuses on the typing experience.

- Space remains available when results for the same composition arrive during a tap. The keyboard still checks the composition and host document before committing text.
- The first candidate row does less work per keystroke, and one-edit spelling repair reuses an index across queries. Both paths preserve the existing matching and ranking rules.
- Six original cat illustrations and palettes cover calico, orange tabby, golden shaded, ragdoll, Maine Coon, and Devon Rex. The keyboard renders illustrations on demand at a fixed size. Existing theme selections continue to resolve.
- The membership entry sizes to its content, supports a larger accessible layout, and keeps pricing, renewal terms, and restoration close to the purchase action. A purchase tap still opens Apple's payment confirmation.

The Pinyin regression set (819 cases) scored 48.72% / 60.07% / 63.98% at Top-1 / Top-3 / Top-5. The T9 set (277 cases) scored 62.09% / 76.17% / 79.78%. These scores describe the fixed synthetic sets. Ranking and typo recovery remain priorities.

The automated production assertion suite and iOS source type checks passed. Complete package building and simulator interaction are pending because the local asset compiler could not connect to CoreSimulator. Phone latency and typing comparisons with other keyboards have not been measured for this build.

Engineering references include the [Rime script translator](https://github.com/rime/librime/blob/master/src/rime/gear/script_translator.cc) and [LibIME Pinyin context](https://github.com/fcitx/libime/blob/master/src/libime/pinyin/pinyincontext.cpp). Their segmentation and matching designs informed the review. The production implementation and artwork are maintained separately.
