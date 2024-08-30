import XCTest
@testable import MainApp

class MainAppTests: XCTestCase {

    func testAddition() throws {
        let result = add(12, 3)
        XCTAssertEqual(result, 15, "Expected 12 + 3 to equal 5")
    }
    
    func testSubtraction() throws {
        let result = subtract(5, 3)
        XCTAssertEqual(result, 2, "Expected 5 - 3 to equal 2")
    }
    
    func testMultiplication() throws {
        let result = multiply(4, 3)
        XCTAssertEqual(result, 12, "Expected 4 * 3 to equal 12")
    }
    
    func testDivision() throws {
        let result = divide(10, 2)
        XCTAssertEqual(result, 5, "Expected 10 / 2 to equal 5")
    }
    
    func testDivisionByZero() throws {
        let result = divide(10, 0)
        XCTAssertNil(result, "Expected division by zero to return nil")
    }
    
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func subtract(_ a: Int, _ b: Int) -> Int {
        return a - b
    }
    
    func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    func divide(_ a: Int, _ b: Int) -> Int? {
        guard b != 0 else { return nil }
        return a / b
    }
}
