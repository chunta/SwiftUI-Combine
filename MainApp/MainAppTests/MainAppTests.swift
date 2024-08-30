//
//  MainAppTests.swift
//  MainAppTests
//
//  Created by Rex Chen on 2021/6/5.
//

import XCTest
@testable import MainApp

class MainAppTests: XCTestCase {

    override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
        }

        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }

        // Test Case 1: Test addition function
        func testAddition() throws {
            let result = add(2, 3)
            XCTAssertEqual(result, 5, "Expected 2 + 3 to equal 5")
        }

        // Test Case 2: Test subtraction function
        func testSubtraction() throws {
            let result = subtract(5, 3)
            XCTAssertEqual(result, 2, "Expected 5 - 3 to equal 2")
        }

        // Test Case 3: Test multiplication function
        func testMultiplication() throws {
            let result = multiply(4, 3)
            XCTAssertEqual(result, 12, "Expected 4 * 3 to equal 12")
        }

        // Test Case 4: Test division function
        func testDivision() throws {
            let result = divide(10, 2)
            XCTAssertEqual(result, 5, "Expected 10 / 2 to equal 5")
        }

        // Test Case 5: Test division by zero
        func testDivisionByZero() throws {
            let result = divide(10, 0)
            XCTAssertNil(result, "Expected division by zero to return nil")
        }

        // Dummy functions to be tested
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
