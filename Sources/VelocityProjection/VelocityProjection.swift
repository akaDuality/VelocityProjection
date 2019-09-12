#if os(iOS)
import UIKit

public extension UIPanGestureRecognizer {
    func projectedTranslation(in view: UIView?, decelerationRate: UIScrollView.DecelerationRate) -> CGPoint {
        let velocityProjection = velocity(in: view).projectedOffset(decelerationRate: decelerationRate.rawValue)
        return translation(in: view) + velocityProjection
    }
    
    func projectedLocation(in view: UIView?, decelerationRate: UIScrollView.DecelerationRate) -> CGPoint {
        let velocityProjection = velocity(in: view).projectedOffset(decelerationRate: decelerationRate.rawValue)
        return location(in: view) + velocityProjection
    }
}

#else
import AppKit

public extension NSPanGestureRecognizer {
    func projectedTranslation(in view: NSView?, decelerationRate: CGFloat) -> CGPoint {
        let velocityProjection = velocity(in: view).projectedOffset(decelerationRate: decelerationRate)
        return translation(in: view) + velocityProjection
    }
}
#endif

public extension CGPoint {
    func projectedOffset(decelerationRate: CGFloat) -> CGPoint {
        return CGPoint(x: x.projectedOffset(decelerationRate: decelerationRate),
                       y: y.projectedOffset(decelerationRate: decelerationRate))
    }
}

public extension CGFloat { // Velocity value
    func projectedOffset(decelerationRate: CGFloat) -> CGFloat {
        // Magic formula from WWDC
        let multiplier = 1 / (1 - decelerationRate) / 1000
        return self * multiplier
    }
}

extension CGPoint {
    static func +(left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x,
                       y: left.y + right.y)
    }
}
