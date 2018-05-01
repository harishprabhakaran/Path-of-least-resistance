//
//  PathOfLowestCostTests.swift
//  PathOfLowestCostTests
//
//  Created by Harish Prabhakaran on 27/04/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import XCTest
@testable import PathOfLowestCost

class PathOfLowestCostTests: XCTestCase {
    
    let matrixValue = [[3,4,1,2,8,6], [6,1,8,2,7,4], [5,9,3,9,9,5], [8,4,1,3,2,6], [3,7,2,8,6,4]]
    let negativeMatrixValue = [[6,3,-5,9], [-5,2,4,10], [3,-2,6,10], [6,-1,-2,10]]
    let singleRowColumnMatrix = [[5, 8, 5, 3, 5]]
    let singleColumnMultiRowMatrix = [[5], [8], [5], [3], [5]]
    let singleValue = [[1]]
    let valueGreaterThan50 = [[69,10,19,10,19], [51,23,20,19,12], [60,12,20,11,10]]
    let matrixWithZeros =  [[0], [0], [0], [0], [0]]
    let longMatrix = [[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]]
    
    var costCalculator : LeastCostCalculator?
    override func setUp() {
        super.setUp()
        costCalculator = LeastCostCalculator()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testWithMatrixValue() {
        let polc = costCalculator?.findPathOfLeastCost(inputArray: matrixValue)
        XCTAssertEqual(16, polc?.cost!)
    }
    
    func testWithNegativeMatrixValue() {
        let polc = costCalculator?.findPathOfLeastCost(inputArray: negativeMatrixValue)
        XCTAssertEqual(0, polc?.cost!)
    }
    
    func testSingleRowSingleColumnMatrix() {
        let polc = costCalculator?.findPathOfLeastCost(inputArray: singleRowColumnMatrix)
        XCTAssertEqual(26, polc?.cost!)
    }
    
    func testSingleColumnMultipleRowMatrix() {
        let polc = costCalculator?.findPathOfLeastCost(inputArray: singleColumnMultiRowMatrix)
        XCTAssertEqual(3, polc?.cost!)
    }
    
    func testSingleValueMatrix() {
        let polc = costCalculator?.findPathOfLeastCost(inputArray: singleValue)
        XCTAssertEqual(1, polc?.cost!)
    }
    
    func testVMatrixWithGreaterThan50Value() {
        let polc = costCalculator?.findPathOfLeastCost(inputArray: valueGreaterThan50)
        XCTAssertEqual(0, polc?.cost!)
    }
    
    func testWithEmptyMatrix() {
        let polc = costCalculator?.findPathOfLeastCost(inputArray: [[]])
        XCTAssertEqual(0, polc?.cost!)
    }
    
    func testWithZeroMatrix() {
        let polc = costCalculator?.findPathOfLeastCost(inputArray: matrixWithZeros)
        XCTAssertEqual(0, polc?.cost!)
    }
    
    func testWithLongMatrix() {
        let polc = costCalculator?.findPathOfLeastCost(inputArray: longMatrix)
        XCTAssertEqual(0, polc?.cost!)
    }
    
}
