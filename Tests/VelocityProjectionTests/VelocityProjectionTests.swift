import XCTest
@testable import VelocityProjection


final class VelocityProjectionTests: XCTestCase {
    
    #if os(iOS)
    func test_fastDecelerationCalculation() {
        let velocity: CGFloat = 100.348
        
        let offset = velocity.projectedOffset(decelerationRate: UIScrollView.DecelerationRate.fast.rawValue)
        XCTAssertEqual(offset, 10.034, accuracy: 0.001)
    }
    
    func test_normalDecelerationCalculation() {
        let velocity: CGFloat = 100.348
        
        let offset = velocity.projectedOffset(decelerationRate: UIScrollView.DecelerationRate.normal.rawValue)
        XCTAssertEqual(offset, 50.174, accuracy: 0.0001)
    }

    static var allTests = [
        ("test_fastDecelerationCalculation", test_fastDecelerationCalculation),
        ("test_slowDecelerationCalculation", test_normalDecelerationCalculation)
    ]
    #endif
}
