# App Store Shipping

This repository contains no signing material, Archive, IPA, App Store configuration, or release logs. Public documentation must not infer live App Store availability from a repository URL.

**Verified backend status (2026-10-09):** version 2.6, build 50 is **Ready for Distribution** in App Store Connect. The owner confirmed initiating release. The approved build, subscription, price and availability settings were not replaced during this check.

**Public availability verified (2026-10-09):** version 2.6 is available on the [US App Store](https://apps.apple.com/us/app/id6813336672), confirmed by Apple's public lookup result (release timestamp 2026-10-09T09:18:52Z). This public-storefront verification covers the US only; it does not establish availability elsewhere. No availability settings were changed.

Local input-experience development is separate from build 50. As recorded on 2026-10-09, development version 2.6.1 (56) has passed production unit regressions, the recorded engine evaluations, and a complete Xcode Release build of the app and extension. Device installation and main-app launch of build 56 are confirmed. The owner reports completing four groups of manual software-keyboard checks without functional anomalies, while cursor dragging still feels insufficiently smooth. Exact iPhone candidate latency and memory under typing load remain unmeasured; these checks do not cover every host, T9, disabled Full Access or purchase restoration.

A 2.6.1 version draft has been created with review notes and manual release selected. The frozen 2.6.1 (56) source has been archived and passed App Store distribution validation. On 2026-10-09, the existing build 56 Archive was uploaded successfully. App Store Connect reports upload processing complete, and build 56 was selected in the 2.6.1 draft, saved, and confirmed after reloading. The draft retains manual release; it has not been added to a review submission, submitted for review, or approved. [TESTING.md](TESTING.md) describes development results; the private production source is not included in this repository.

Archive creation, distribution validation, upload, processing, review approval, and public release are separate milestones. A later development build is not an App Store release unless its own submission and release are independently confirmed.

**Local follow-up (2026-10-10):** 2.6.1 (57) passed production unit regressions and a complete iOS Release build for cursor-drag changes. It has not been installed and verified on the development phone, archived or uploaded. This does not replace the previously uploaded build 56 or change its draft/review state. The released build 50 remains separate.
