import AppKit

extension NSLayoutConstraint.Priority {
    @inlinable static func valueOrNil(_ value: Float?) -> NSLayoutConstraint.Priority? {
        guard let v = value else { return nil }
        return NSLayoutConstraint.Priority(rawValue: v)
    }
}

extension NSEdgeInsets {
    @inlinable init(edgeInset: CGFloat) {
        self.init(top: edgeInset, left: edgeInset, bottom: edgeInset, right: edgeInset)
    }
}

extension NSUserInterfaceLayoutOrientation {
    var nsLayoutConstraintOrientation: NSLayoutConstraint.Orientation {
        switch self {
        case .horizontal:
            return .horizontal
        case .vertical:
            return .vertical
        @unknown default:
            fatalError()
        }
    }
}
