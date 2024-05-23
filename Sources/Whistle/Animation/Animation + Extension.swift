import Foundation

public extension Animation {
    static func fadeIn(duration: TimeInterval = 0.3) -> Animation {
        Animation(duration: duration, closure: { $0.alpha = 1 })
    }
}

public extension Animation {
    static func resize(to size: CGSize, duration: TimeInterval = 0.3) -> Animation {
        Animation(duration: duration, closure: { $0.bounds.size = size })
    }
}
