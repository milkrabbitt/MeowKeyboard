# StoreKit 2

The production app keeps purchase and entitlement verification in the main app. Verified entitlement state is shared locally with the keyboard extension through an App Group; the extension does not start purchases.

The production flow uses StoreKit transaction verification, current entitlements, transaction updates, restore, expiry, and revocation handling. A local snapshot is a bounded offline aid, not an independent proof of purchase. The public example exposes only an injectable state boundary and uses an example product identifier.
