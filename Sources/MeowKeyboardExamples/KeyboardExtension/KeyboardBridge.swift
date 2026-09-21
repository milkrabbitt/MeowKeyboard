// Simplified public example.
// Production implementation differs and remains private.
#if canImport(UIKit)
import UIKit
public final class ExampleKeyboardViewController: UIInputViewController {
    private var composition = CompositionState()
    public override func viewDidLoad() { super.viewDidLoad(); needsInputModeSwitchKey = true }
    public func insertLiteral(_ text: String) { textDocumentProxy.insertText(text) }
    public func select(_ candidate: Candidate) { guard composition.choose(candidate) else { return }; textDocumentProxy.insertText(composition.committedText) }
}
#endif
