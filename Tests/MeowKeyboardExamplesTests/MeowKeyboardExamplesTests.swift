import XCTest
@testable import MeowKeyboardExamples
final class MeowKeyboardExamplesTests: XCTestCase {
 func testSelectionLeavesRemainingComposition() { var state=CompositionState(rawInput:"woaini"); let r=state.rawInput.index(state.rawInput.startIndex,offsetBy:2); XCTAssertTrue(state.choose(Candidate(id:"wo",text:"我",consumedRange:state.rawInput.startIndex..<r))); XCTAssertEqual(state.committedText,"我"); XCTAssertEqual(state.rawInput,"aini") }
 func testDeleteAndReset() { var state=CompositionState(rawInput:"wo"); state.deleteBackward(); XCTAssertEqual(state.rawInput,"w"); state.reset(); XCTAssertTrue(state.isEmpty) }
 func testDeduplication() { let s="wo"; let c=Candidate(id:"a",text:"我",consumedRange:s.startIndex..<s.endIndex); XCTAssertEqual(DemoRanker().rank([c,c],lexicon:MemoryUserLexicon()).count,1) }
 func testExpiryAndRevoke() { let now=Date(); let resolver=EntitlementResolver(); XCTAssertEqual(resolver.state(snapshot:EntitlementSnapshot(expiry:now.addingTimeInterval(1)),now:now),.active(until:now.addingTimeInterval(1))); XCTAssertEqual(resolver.state(snapshot:EntitlementSnapshot(expiry:now.addingTimeInterval(1),revoked:true),now:now),.revoked); XCTAssertEqual(resolver.state(snapshot:EntitlementSnapshot(expiry:now.addingTimeInterval(-1)),now:now),.inactive) }
 func testPendingDoesNotRepresentEntitlementLoss() { XCTAssertEqual(PurchaseResult.pending, .pending) }
}
