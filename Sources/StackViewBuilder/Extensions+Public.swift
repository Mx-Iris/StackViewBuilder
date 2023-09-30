import AppKit

public extension NSStackView {
    /// Indicate that the stack view removes hidden views from its view hierarchy.
    func detachesHiddenViews(_ detaches: Bool = true) -> Self {
        detachesHiddenViews = detaches
        return self
    }

    /// The minimum spacing, in points, between adjacent views in the stack view.
    func spacing(_ spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }

    /// Set the edge insets for the stack view
    func stackPadding(_ edgeInset: CGFloat) -> Self {
        edgeInsets = NSEdgeInsets(edgeInset: edgeInset)
        return self
    }

    /// Set the edge insets for the stack view
    func stackPadding(_ edgeInsets: NSEdgeInsets) -> Self {
        self.edgeInsets = edgeInsets
        return self
    }

    /// The spacing and sizing distribution of stacked views along the primary axis. Defaults to GravityAreas.
    func distribution(_ dist: NSStackView.Distribution) -> Self {
        distribution = dist
        return self
    }

    /// The view alignment within the stack view.
    func alignment(_ alignment: NSLayoutConstraint.Attribute) -> Self {
        self.alignment = alignment
        return self
    }

    /// Sets the Auto Layout priority for the stack view to minimize its size, for a specified user interface axis.
    func hugging(h: Float? = nil, v: Float? = nil) -> Self {
        if let h = NSLayoutConstraint.Priority.valueOrNil(h) {
            setHuggingPriority(h, for: .horizontal)
        }
        if let v = NSLayoutConstraint.Priority.valueOrNil(v) {
            setHuggingPriority(v, for: .vertical)
        }
        return self
    }

    func clippingResistance(h: Float? = nil, v: Float? = nil) -> Self {
        if let h = NSLayoutConstraint.Priority.valueOrNil(h) {
            setClippingResistancePriority(h, for: .horizontal)
        }
        if let v = NSLayoutConstraint.Priority.valueOrNil(v) {
            setClippingResistancePriority(v, for: .vertical)
        }
        return self
    }

    // MARK: - Edge insets

    /// The geometric padding, in points, inside the stack view, surrounding its views.
    func edgeInsets(_ edgeInsets: NSEdgeInsets) -> Self {
        self.edgeInsets = edgeInsets
        return self
    }

    /// The geometric padding, in points, inside the stack view, surrounding its views.
    @inlinable func edgeInsets(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> Self {
        return edgeInsets(NSEdgeInsets(top: top, left: left, bottom: bottom, right: right))
    }

    /// The geometric padding, in points, inside the stack view, surrounding its views.
    func edgeInsets(_ value: CGFloat) -> Self {
        return edgeInsets(NSEdgeInsets(top: value, left: value, bottom: value, right: value))
    }
}

public extension NSView {
    /// Set the hugging priorites for the stack
    func contentHugging(h: NSLayoutConstraint.Priority? = nil, v: NSLayoutConstraint.Priority? = nil) -> Self {
        if let h = h {
            setContentHuggingPriority(h, for: .horizontal)
        }
        if let v = v {
            setContentHuggingPriority(v, for: .vertical)
        }
        return self
    }

    func contentCompressionResistance(h: NSLayoutConstraint.Priority? = nil, v: NSLayoutConstraint.Priority? = nil) -> Self {
        if let h = h {
            setContentCompressionResistancePriority(h, for: .horizontal)
        }

        if let v = v {
            setContentCompressionResistancePriority(v, for: .vertical)
        }
        return self
    }

    func contentCompressionResistance(h: Float? = nil, v: Float? = nil) -> Self {
        return contentCompressionResistance(h: .valueOrNil(h), v: .valueOrNil(v))
    }

    /// Set the hugging priorites for the stack
    func contentHugging(h: Float? = nil, v: Float? = nil) -> Self {
        return contentHugging(h: .valueOrNil(h), v: .valueOrNil(v))
    }
}
