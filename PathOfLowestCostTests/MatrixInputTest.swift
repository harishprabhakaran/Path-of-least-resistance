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
    
    let invalidRowColumnMatrix = "1 2 3\n4 5 6\n7 8 9"
    let matrixWithCharacters = "1 2 3\nr 5 6\n7 8 9"
    let matrixWithEmptyRow = "1 2 3\n \n5 6 7\n\n\n"
    let emptyMatrixValue = ""
    let nonEqualRows = "1 2 3\n1 2"
    let sample5X3Matrix = "19 10 19 10 19\n21 23 20 19 12\n20 12 20 11 10"
    
    var inputValidator: MatrixValidator!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        inputValidator = MatrixValidator()
    }
    
    func testMinimumRowMatrixValidation() {
        let output = inputValidator.validateMatrix(with: invalidRowColumnMatrix)
        XCTAssertEqual([], output.matrix)
        XCTAssertTrue(output.matrix.count == 0, output.errorMessage.rawValue)
    }
    
    func testMinMaxRowColMatrixValidation() {
        let output = inputValidator.validateMatrix(with: invalidRowColumnMatrix)
        XCTAssertEqual([], output.matrix)
        XCTAssertEqual("Please enter minimum of 1 row and 5 columns up to 10 rows and 100 columns", output.errorMessage.rawValue)
    }
    
    func testEmptyMatrixValue() {
        let output = inputValidator.validateMatrix(with: emptyMatrixValue)
        XCTAssertEqual([], output.matrix)
        XCTAssertEqual("Please enter Matrix Value", output.errorMessage.rawValue)
    }
    
    func testMatrixWithCharacters() {
        let output = inputValidator.validateMatrix(with: matrixWithCharacters)
        XCTAssertEqual([], output.matrix)
        XCTAssertEqual("Please enter only numeric values", output.errorMessage.rawValue)
    }
    
    func testMatrixWithEmptyRow() {
        let output = inputValidator.validateMatrix(with: matrixWithEmptyRow)
        XCTAssertEqual([], output.matrix)
    }
    
    func testNonEqualRows() {
        let output = inputValidator.validateMatrix(with: nonEqualRows)
        XCTAssertEqual([], output.matrix)
        XCTAssertEqual("Please enter equal number of rows in matrix", output.errorMessage.rawValue)
    }
    
    func testValidMatrix() {
        let output = inputValidator.validateMatrix(with: sample5X3Matrix)
        XCTAssertEqual([[19,10,19,10,19], [21,23,20,19,12], [20,12,20,11,10]], output.matrix)
        XCTAssertEqual("", output.errorMessage.rawValue)
    }
}
