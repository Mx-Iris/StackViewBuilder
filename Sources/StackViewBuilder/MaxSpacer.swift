import AppKit

public class MaxSpacer: NSView {
    public init() {
        super.init(frame: .zero)
        wantsLayer = true
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
