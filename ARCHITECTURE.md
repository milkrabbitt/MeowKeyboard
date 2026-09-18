# Architecture

The SwiftUI main app handles onboarding, preferences, privacy/help entry points, and StoreKit purchasing. The keyboard extension is responsible for composition, candidate presentation, text insertion, and local personalization.

The main app shares a bounded entitlement snapshot through an App Group. The extension does not initiate purchases and can read the last verified snapshot if StoreKit is temporarily unavailable.

Input data and personalization are designed to remain on device. The public repository intentionally omits the production lexicon, ranking pipeline, and user-data implementation.
