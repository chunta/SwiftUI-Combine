import XCTest
@testable import MainApp

class MainAppTests: XCTestCase {

    func testAddition() throws {
        let result = add(121, 30)
        XCTAssertEqual(result, 151, "Expected 121 + 30 to equal 151")
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
    
    func add(_ firstNumber: Int, _ secondNumber: Int) -> Int {
        return firstNumber + secondNumber
    }

    func subtract(_ minuend: Int, _ subtrahend: Int) -> Int {
        return minuend - subtrahend
    }

    func multiply(_ multiplicand: Int, _ multiplier: Int) -> Int {
        return multiplicand * multiplier
    }

    func divide(_ dividend: Int, _ divisor: Int) -> Int? {
        guard divisor != 0 else { return nil }
        return dividend / divisor
    }
}
