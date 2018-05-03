//
//  MatrixInputTest.swift
//  PathOfLowestCostTests
//
//  Created by Harish Prabhakaran on 30/04/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import XCTest
@testable import PathOfLowestCost

class MatrixInputTest: XCTestCase {
    
    let matrixValue = "1 2 3\n4 5 6\n7 8 9"
    let longMatrixValue = "1 2 3\n4 5 6\n7 8 9\n1 2 3\n4 5 6\n7 8 9\n\n4 5 6\n7 8 9\n\n4 5 6\n7 8 9\n"
    let matrixWithCharacters = "1 2 3\nr 5 6\n7 8 9"
    let matrixWithEmptyRow = "1 2 3\n \n5 6 7\n\n\n"
    let emptyMatrixValue = ""
    let lengthMatrix = "11111111111111111"
    let nonEqualRows = "1 2 3\n1 2"
    
    var inputValidator: MatrixValidator!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        inputValidator = MatrixValidator()
    }
    
    func testSmallMatrixValidation() {
        let output = inputValidator.validateMatrix(with: matrixValue)
        XCTAssertEqual([[1,2,3], [4,5,6], [7,8,9]], output)
    }
    
    func testLongMatrixValidation() {
        let output = inputValidator.validateMatrix(with: longMatrixValue)
        XCTAssertEqual([[1,2,3], [4,5,6], [7,8,9],[1,2,3], [4,5,6], [7,8,9], [4,5,6], [7,8,9],[4,5,6], [7,8,9]], output)
    }
    
    func testEmptyMatrixValue() {
        let output = inputValidator.validateMatrix(with: emptyMatrixValue)
        XCTAssertEqual([], output)
    }
    
    func testMatrixWithCharacters() {
        let output = inputValidator.validateMatrix(with: matrixWithCharacters)
        XCTAssertEqual([], output)
    }
    
    func testMatrixWithEmptyRow() {
        let output = inputValidator.validateMatrix(with: matrixWithEmptyRow)
        XCTAssertEqual([], output)
    }
    
    func testLengthMatrix() {
        let output = inputValidator.validateMatrix(with: lengthMatrix)
        XCTAssertEqual([[11111111111111111]], output)
    }
    
    func testNonEqualRows() {
        let output = inputValidator.validateMatrix(with: nonEqualRows)
        XCTAssertEqual([], output)
    }
}
