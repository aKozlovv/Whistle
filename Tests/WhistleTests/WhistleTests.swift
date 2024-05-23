import XCTest
@testable import Whistle

final class WhistleTests: XCTestCase {
    func testFadeIn() {
        let foo = UILabel()
        foo.animate(.fadeIn())
        XCTAssertEqual(foo.alpha, 1)
    }
    
    func testResize() {
        let foo = UILabel()
        foo.animate(.resize(to: CGSize(width: 250, height: 21)))
        
        XCTAssertEqual(
            foo.bounds.size,
            CGSize(width: 250, height: 21))
    }
    
    func testFadeInToken() {
        let foo = UIView()
        
        XCTAssertEqual(
            foo.animate(.fadeIn()),
            AnimationToken(
                view: foo,
                animations: [.fadeIn()],
                mode: .inSequence))
    }
}
