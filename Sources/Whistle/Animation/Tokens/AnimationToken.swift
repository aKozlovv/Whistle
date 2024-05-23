import UIKit

public final class AnimationToken: Equatable {
    private let view: UIView
    private let animations: [Animation]
    private let mode: AnimationMode
    private var isValid = true
    
    internal init(
        view: UIView,
        animations: [Animation],
        mode: AnimationMode)
    {
        self.view = view
        self.animations = animations
        self.mode = mode
    }
    
    
    deinit {
        perform { }
    }
    
    internal func perform(handler: @escaping () -> Void) {
        guard isValid else {
            return
        }
        
        isValid = false
        
        switch mode {
        case .inSequence:
            view.performAnimations(animations, completionHandler: handler)
            
        case .inParallel:
            view.performAnimationsInParallel(animations, completionHandler: handler)
        }
    }
    
    public static func == (lhs: AnimationToken, rhs: AnimationToken) -> Bool {
        lhs.view == rhs.view
    }
}
