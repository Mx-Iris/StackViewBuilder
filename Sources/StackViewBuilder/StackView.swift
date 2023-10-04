import AppKit

public extension NSStackView {
    convenience init(orientation: NSUserInterfaceLayoutOrientation, distribution: NSStackView.Distribution, alignment: NSLayoutConstraint.Attribute, spacing: CGFloat, views: [NSView]) {
        self.init(views: [])
        self.orientation = orientation
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing

        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            
            if let gravity = view.gravity {
                self.addView(view, in: gravity)
            } else {
                self.addArrangedSubview(view)
            }
            
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

extension NSView {
    private static var __associated_gravityKey: UInt8 = 0
    fileprivate var gravity: NSStackView.Gravity? {
        get {
            objc_getAssociatedObject(
                self,
                &Self.__associated_gravityKey
            ) as? NSStackView.Gravity?
            ?? nil
        }
        set {
            objc_setAssociatedObject(
                self,
                &Self.__associated_gravityKey,
                newValue,
                .OBJC_ASSOCIATION_COPY
            )
        }
    }
    public func gravity(_ gravity: NSStackView.Gravity) -> Self {
        self.gravity = gravity
        return self
    }
}
