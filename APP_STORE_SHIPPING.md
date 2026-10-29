# App Store Shipping

This repository contains no signing material, Archive, IPA, App Store configuration, or release logs. Public documentation must not infer live App Store availability from a repository URL.

**Verified backend status (2026-10-09):** version 2.6, build 50 is **Ready for Distribution** in App Store Connect. The owner confirmed initiating release. The approved build, subscription, price and availability settings were not replaced during this check.

**Public availability verified (2026-10-09):** version 2.6 is available on the [US App Store](https://apps.apple.com/us/app/id6813336672), confirmed by Apple's public lookup result (release timestamp 2026-10-09T09:18:52Z). This public-storefront verification covers the US only; it does not establish availability elsewhere. No availability settings were changed.

Local input-experience development is separate from build 50. As recorded on 2026-10-09, development version 2.6.1 (56) has passed production unit regressions, the recorded engine evaluations, and a complete Xcode Release build of the app and extension. Device installation and main-app launch of build 56 are confirmed. The owner reports completing four groups of manual software-keyboard checks without functional anomalies, while cursor dragging still feels insufficiently smooth. Exact iPhone candidate latency and memory under typing load remain unmeasured; these checks do not cover every host, T9, disabled Full Access or purchase restoration.

Historical build 56 checkpoint: a 2.6.1 version draft was created with review notes and manual release selected. The frozen 2.6.1 (56) source has been archived and passed App Store distribution validation. On 2026-10-09, the existing build 56 Archive was uploaded successfully. App Store Connect reports upload processing complete, and build 56 was selected in the 2.6.1 draft, saved, and confirmed after reloading. The draft retains manual release; it has not been added to a review submission, submitted for review, or approved. [TESTING.md](TESTING.md) describes development results; the private production source is not included in this repository.

Archive creation, distribution validation, upload, processing, review approval, and public release are separate milestones. A later development build is not an App Store release unless its own submission and release are independently confirmed.

**Follow-up (2026-10-12):** the unchanged 2.6.1 (57) source passed a complete Release Archive and App Store distribution validation. The app and extension have matching versions and distribution entitlements. Upload succeeded without errors; App Store Connect reports processing complete and build 57 ready to submit. Build 57 was selected in the 2.6.1 draft, saved, and confirmed after reloading. Updated release notes and review notes have been saved, with manual release retained. No review submission or release was performed. Xcode confirms the development phone is connected with build 57 installed. The owner provisionally accepts improved cursor dragging, with remaining smoothness limitations; phone candidate latency and typing-load memory remain unmeasured.


**Membership follow-up (2026-10-12):** build 57 is retained but paused as the final candidate after membership issues were reported. Incremental build 2.6.1 (58) passed production assertion regressions, two physical-device StoreKitTest cases, the complete Release build, device installation/main-app launch, Archive and App Store distribution validation. Upload succeeded without errors; Apple processing is complete and build 58 is ready to submit; build 58 is selected in the saved 2.6.1 draft and was confirmed after reloading. Manual release is retained. The existing annual product is approved; terms, price, subscription configuration and entitlements were not changed. No review submission or release was performed. Sandbox completion and additional device acceptance limitations are recorded in [TESTING.md](TESTING.md).


## Backend recheck — 2026-10-27

App Store Connect still shows version 2.6 Ready for Distribution and 2.6.1 Prepare for Submission with build 58 selected. Local 2.6.1 (59) is installed on the development phone and remains unuploaded. No build, review submission or release was performed during this recheck. The US public-storefront verification above remains dated 2026-10-09; a fresh public-storefront lookup was unavailable through the current verification tool. Do not interpret the backend status as a new all-region availability check. Regional compliance information was supplemented, but the mainland availability row still showed a compliance block during the check; mainland availability is not claimed.


## Regional availability follow-up — 2026-10-27

After the compliance field was saved, a refreshed Asia-Pacific availability table shows China mainland **Available**. Apple’s public lookup independently returns the existing app, correct bundle identifier and version 2.6 for both China mainland and the US. This supersedes the earlier same-day mainland block above. The public listing is verified; an on-device mainland download transaction was not performed. No new review submission, release, price change or replacement build was required. The development/draft distinction remains unchanged.

**Public recheck (2026-10-29):** Apple's public lookup again returns version 2.6 in both storefronts. Authenticated backend draft status was not established by that public lookup and must be checked separately. No new build or release is implied.


**Authenticated follow-up (2026-10-29):** App Store Connect confirms 2.6 Ready for Distribution, with build 58 selected in the 2.6.1 Prepare for Submission draft and manual release retained. Regional availability lists 175 available territories. Official administrative records now show the company subject, website and iOS app registrations approved; these administrative approvals do not mean Apple organization conversion is complete. No new build, review submission or release was performed.


## Authenticated draft recheck — 2026-10-29

App Store Connect was independently inspected: version 2.6 remains Ready for Distribution; 2.6.1 remains Prepare for Submission with build 58 selected and manual release selected. No review submission or release was performed. Local build 59 retains build 58 membership changes and adds the separately documented input-resource/reading fixes. A fresh command-line Release Archive failed in asset compilation because the local CoreSimulator runtime service was unavailable; this is not distribution validation, and build 59 is not claimed uploaded. A complete GUI Release Archive subsequently succeeded for the unchanged app and extension, both 2.6.1 (59). Xcode subsequently reported that 2.6.1 (59) successfully passed all App Store validation checks. This is not an upload or review submission; the saved App Store Connect draft still selects build 58. The current-source assertion regression is recorded in [TESTING.md](TESTING.md).
