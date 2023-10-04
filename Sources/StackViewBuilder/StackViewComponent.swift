import AppKit

public protocol StackViewComponent: NSView {}

extension NSView: StackViewComponent {}

public extension StackViewComponent {
    func size(width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        return self
    }
    
    @inlinable
    func size(_ size: NSSize) -> Self {
        self.size(width: size.width, height: size.height)
    }
}
