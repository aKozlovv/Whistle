import UIKit

public func animate(_ tokens: [AnimationToken]) {
    guard tokens.isEmpty == false else {
        return
    }
    
    var tokens = tokens
    let token = tokens.removeFirst()
    
    token.perform {
        animate(tokens)
    }
}

public extension UIView {
    
    @discardableResult
    func animate(_ animations: [Animation]) -> AnimationToken {
        return AnimationToken(
            view: self,
            animations: animations,
            mode: .inSequence
        )
    }
    
    @discardableResult
    func animate(inParallel animations: [Animation]) -> AnimationToken {
        return AnimationToken(
            view: self,
            animations: animations,
            mode: .inParallel
        )
    }
}

internal extension UIView {
    func performAnimations(_ animations: [Animation], completionHandler: @escaping () -> Void) {
        // This implementation is exactly the same as before, only now we call
        // the completion handler when our exit condition is hit
        guard animations.isEmpty == false else {
            return completionHandler()
        }
        
        var animations = animations
        let animation = animations.removeFirst()
        
        UIView.animate(withDuration: animation.duration, animations: {
            animation.closure(self)
        }, completion: { _ in
            self.performAnimations(animations, completionHandler: completionHandler)
        })
    }
    
    func performAnimationsInParallel(_ animations: [Animation], completionHandler: @escaping () -> Void) {
        // If we have no animations, we can exit early
        guard animations.isEmpty == false else {
            return completionHandler()
        }
        
        // In order to call the completion handler once all animations
        // have finished, we need to keep track of these counts
        let animationCount = animations.count
        var completionCount = 0
        
        let animationCompletionHandler = {
            completionCount += 1
            
            // Once all animations have finished, we call the completion handler
            if completionCount == animationCount {
                completionHandler()
            }
        }
        
        // Same as before, only with the call to the animation
        // completion handler added
        for animation in animations {
            UIView.animate(withDuration: animation.duration, animations: {
                animation.closure(self)
            }, completion: { _ in
                animationCompletionHandler()
            })
        }
    }
}

