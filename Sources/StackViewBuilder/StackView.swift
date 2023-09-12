import AppKit

public extension NSStackView {
    convenience init(orientation: NSUserInterfaceLayoutOrientation, distribution: NSStackView.Distribution, alignment: NSLayoutConstraint.Attribute, spacing: CGFloat, views: [NSView]) {
        self.init(views: views)
        self.orientation = orientation
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing

        views.forEach { view in
            if let spacer = view as? Spacer {
                spacer.orientation = orientation
            }

            if let maxSpacer = view as? MaxSpacer {
                maxSpacer.setContentHuggingPriority(.fittingSizeCompression, for: orientation.nsLayoutConstraintOrientation)
                maxSpacer.setContentCompressionResistancePriority(.fittingSizeCompression, for: orientation.nsLayoutConstraintOrientation)
            }
        }
    }
}

public class HStackView: NSStackView {
    public convenience init(distribution: NSStackView.Distribution = .gravityAreas, alignment: NSLayoutConstraint.Attribute = .centerY, spacing: CGFloat = 0, @StackViewBuilder views: () -> [StackViewComponent]) {
        self.init(orientation: .horizontal, distribution: distribution, alignment: alignment, spacing: spacing, views: views())
    }
}

public class VStackView: NSStackView {
    public convenience init(distribution: NSStackView.Distribution = .gravityAreas, alignment: NSLayoutConstraint.Attribute = .centerX, spacing: CGFloat = 0, @StackViewBuilder views: () -> [StackViewComponent]) {
        self.init(orientation: .vertical, distribution: distribution, alignment: alignment, spacing: spacing, views: views())
    }
}
