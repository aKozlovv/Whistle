import UIKit


/// High order func
public func animate(_ tokens: AnimationToken...) {
    animate(tokens)
}

/// Whistle API
public extension UIView {
    @discardableResult
    func animate(_ animations: Animation...) -> AnimationToken {
        return animate(animations)
    }
    
    @discardableResult
    func animate(inParallel animations: Animation...) -> AnimationToken {
        return animate(inParallel: animations)
    }
}
