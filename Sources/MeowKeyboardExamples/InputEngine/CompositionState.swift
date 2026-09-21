// Simplified public example.
// Production implementation differs and remains private.
import Foundation

public struct Candidate: Hashable, Identifiable {
    public let id: String
    public let text: String
    public let consumedRange: Range<String.Index>
    public init(id: String, text: String, consumedRange: Range<String.Index>) { self.id = id; self.text = text; self.consumedRange = consumedRange }
}

public struct CompositionState: Equatable {
    public private(set) var rawInput: String = ""
    public private(set) var committedText: String = ""
    public init(rawInput: String = "", committedText: String = "") { self.rawInput = rawInput; self.committedText = committedText }
    public var isEmpty: Bool { rawInput.isEmpty }
    public mutating func append(_ text: String) { rawInput += text }
    public mutating func choose(_ candidate: Candidate) -> Bool {
        guard candidate.consumedRange.lowerBound >= rawInput.startIndex, candidate.consumedRange.upperBound <= rawInput.endIndex else { return false }
        committedText += candidate.text
        rawInput.removeSubrange(candidate.consumedRange)
        return true
    }
    public mutating func deleteBackward() { guard !rawInput.isEmpty else { return }; rawInput.removeLast() }
    public mutating func reset() { rawInput = ""; committedText = "" }
}

public protocol CandidateProvider { func candidates(for input: String) -> [Candidate] }
public struct DemoCandidateProvider: CandidateProvider {
    public init() {}
    public func candidates(for input: String) -> [Candidate] {
        let mapping = ["wo": ["我"], "aini": ["爱你"], "woaini": ["我爱你"]]
        return (mapping[input] ?? []).enumerated().map { offset, text in Candidate(id: "\(input)-\(offset)", text: text, consumedRange: input.startIndex..<input.endIndex) }
    }
}
public protocol UserLexicon { func boost(for text: String) -> Int; mutating func record(_ text: String) }
public struct MemoryUserLexicon: UserLexicon { private var counts: [String:Int] = [:]; public init() {}; public func boost(for text:String)->Int { counts[text,default:0] }; public mutating func record(_ text:String) { counts[text,default:0] += 1 } }
public struct DemoRanker { public init() {}; public func rank(_ candidates:[Candidate], lexicon: any UserLexicon) -> [Candidate] { Array(Dictionary(grouping: candidates, by: \.text).values.compactMap(\.first).sorted { (lexicon.boost(for:$0.text),$0.text) > (lexicon.boost(for:$1.text),$1.text) }) } }
