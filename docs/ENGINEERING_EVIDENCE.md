# Engineering Evidence

| Area | Evidence type | Scope and limitation |
|---|---|---|
| Input composition | Production source inspection, 2026-09-18 | Confirms controller use of composition state and candidate interaction; does not publish implementation. |
| Keyboard Extension | Production source inspection, 2026-09-18 | Confirms `UIInputViewController` and `textDocumentProxy` integration. |
| Local persistence | Production source inspection, 2026-09-18 | Confirms SQLite import and local-learning code paths; not a performance measurement. |
| StoreKit | Production source inspection and historical handoff | Confirms StoreKit 2 boundary and entitlement refresh paths; no live transaction test performed for this repository. |
| Public package | Local SwiftPM attempt, 2026-09-18 | Test attempt blocked by host sandbox restrictions; not reported as passed. |
