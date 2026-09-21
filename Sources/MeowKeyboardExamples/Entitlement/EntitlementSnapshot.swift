// Simplified public example.
// Production implementation differs and remains private.
import Foundation
public enum EntitlementState: Equatable { case active(until: Date), inactive, revoked }
public struct EntitlementSnapshot: Codable, Equatable { public let productID:String; public let expiry:Date?; public let revoked:Bool; public init(productID:String="example.meowkeyboard.yearly",expiry:Date?,revoked:Bool=false){self.productID=productID;self.expiry=expiry;self.revoked=revoked} }
public struct EntitlementResolver { public init() {} ; public func state(snapshot: EntitlementSnapshot?, now: Date) -> EntitlementState { guard let snapshot else { return .inactive }; if snapshot.revoked { return .revoked }; guard let expiry=snapshot.expiry, expiry > now else { return .inactive }; return .active(until: expiry) } }
public enum PurchaseResult { case success(EntitlementSnapshot), pending, cancelled, failed }
public protocol TransactionVerifying { func refresh() async throws -> EntitlementSnapshot? }
