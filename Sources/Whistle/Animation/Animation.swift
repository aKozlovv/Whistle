import UIKit

public struct Animation: Equatable {
    public let duration: TimeInterval
    public let closure: (UIView) -> Void
    
    public static func == (lhs: Animation, rhs: Animation) -> Bool {
        lhs.duration == rhs.duration
    }
}

