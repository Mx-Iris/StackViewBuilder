import AppKit

public class Spacer: NSView {
    public let spacing: CGFloat

    public var orientation: NSUserInterfaceLayoutOrientation = .horizontal

    public init(spacing: CGFloat = 5) {
        self.spacing = spacing
        super.init(frame: .zero)
        wantsLayer = true
        layer?.backgroundColor = .clear
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override var intrinsicContentSize: NSSize {
        switch orientation {
        case .horizontal:
            return .init(width: spacing, height: NSView.noIntrinsicMetric)
        case .vertical:
            return .init(width: NSView.noIntrinsicMetric, height: spacing)
        @unknown default:
            return super.intrinsicContentSize
        }
    }
}
