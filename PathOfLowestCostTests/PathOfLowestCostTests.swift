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
    
    let sample5X6Matrix1 = [[3,4,1,2,8,6], [6,1,8,2,7,4], [5,9,3,9,9,5], [8,4,1,3,2,6], [3,7,2,8,6,4]]
    let sample5X6Matrix2 = [[3,4,1,2,8,6], [6,1,8,2,7,4], [5,9,3,9,9,5], [8,4,1,3,2,6], [3,7,2,1,2,3]]
    let sample5X3NoPath = [[19,10,19,10,19], [21,23,20,19,12], [20,12,20,11,10]]
    let singleRowColumnMatrix = [[5, 8, 5, 3, 5]]
    let singleColumnMultiRowMatrix = [[5], [8], [5], [3], [5]]
    let singleValue = [[1]]
    let matrixStartingWith50 = [[69,10,19,10,19], [51,23,20,19,12], [60,12,20,11,10]]
    let matrixOnevalueGreaterThan50 = [[60,3,3,6], [6,3,7,9], [5,6,8,3]]
    let negativeMatrixValue = [[6,3,-5,9], [-5,2,4,10], [3,-2,6,10], [6,-1,-2,10]]
    let matrixWithCompletePath = [[51,51], [0,51], [51,51], [5,5]]
    let matrixWithInCompletePath = [[51,51,51], [0,51,51], [51,51,51], [5,5,51]]
    let matrixWithZeros =  [[0], [0], [0], [0], [0]]
    let longMatrix = [[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]]
    let nonNumericMatrix = [[5,4,"H"], [8,"M",7], [5,7,5]]
    var costCalculator: LeastCostCalculator?
    override func setUp() {
        super.setUp()
        costCalculator = LeastCostCalculator()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // Sample 1: (6X5 matrix normal flow)
    func testSample5X6Matrix1() {
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: sample5X6Matrix1)
        XCTAssertEqual(nodeTuple?.cost, 16)
    }
    
    // Sample 2: (6X5 matrix normal flow)
    func testSample5X6Matrix2() {
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: sample5X6Matrix2)
        XCTAssertEqual(nodeTuple?.cost, 11)
    }
    
    // Sample 3: (5X3 matrix with no path <50)
    func testSample5X3NoPath() {
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: sample5X3NoPath)
        XCTAssertEqual(nodeTuple?.cost, 48)
        XCTAssertEqual(nodeTuple?.valid, false)
    }
    
    // Sample 4: (1X5 matrix)
    func testSingleRowSingleColumnMatrix() {
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: singleRowColumnMatrix)
        XCTAssertEqual(nodeTuple?.cost, 26)
        XCTAssertEqual(nodeTuple?.path, [1,1,1,1,1])
    }
    
    // Sample 5: (5X1 matrix)
    func testSingleColumnMultipleRowMatrix() {
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: singleColumnMultiRowMatrix)
        XCTAssertEqual(nodeTuple?.cost, 3)
    }
    
    // Sample 7: (No input - Optional)
    func testWithEmptyMatrix() {
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: [[]])
        XCTAssertEqual(nodeTuple?.cost, 0)
    }
    
    // Sample 8: (Starting with >50)
    func testMatrixStartingWith50() {
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: matrixStartingWith50)
        XCTAssertEqual(nodeTuple?.cost, 0)
        XCTAssertEqual(nodeTuple?.path, [])
    }
    
    // Sample 9: (One value >50)
    func testMatrixOnevalueGreaterThan50() {
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: matrixOnevalueGreaterThan50)
        XCTAssertEqual(nodeTuple?.cost, 14)
    }
    
    // Sample 10: (Negative values)
    func testWithNegativeMatrixValue() {
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: negativeMatrixValue)
        XCTAssertEqual(nodeTuple?.cost, 0)
        XCTAssertEqual(nodeTuple?.path, [2,3,4,1])
        XCTAssertEqual(nodeTuple?.valid, true)
    }
    
    // Sample 11: Complete path vs. lower cost incomplete path
    func testMatrixWithCompletePath() {
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: matrixWithCompletePath)
        XCTAssertEqual(nodeTuple?.cost, 10)
        XCTAssertEqual(nodeTuple?.path, [4,4])
        XCTAssertEqual(nodeTuple?.valid, true)

    }
    
    // Sample 12: Longer incomplete path vs. shorter lower cost incomplete path
    func testMatrixWithInCompletePath() {
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: matrixWithInCompletePath)
        XCTAssertEqual(nodeTuple?.cost, 10)
        XCTAssertEqual(nodeTuple?.path, [4,4])
        XCTAssertEqual(nodeTuple?.valid, false)
    }
    
    // Sample 13: Large number of columns
    func testWithLongMatrix() {
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: longMatrix)
        XCTAssertEqual(nodeTuple?.cost, 20)
        XCTAssertEqual(nodeTuple?.path, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
    }
    
    // Sample 14 : Single value matrix
    func testSingleValueMatrix() {
        //let polc = costCalculator?.findPathOfLeastCost(inputArray: singleValue)
        //XCTAssertEqual(1, polc?.cost!)
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: singleValue)
        XCTAssertEqual(nodeTuple?.cost, 1)
    }
    
    func testWithZeroMatrix() {
        //let polc = costCalculator?.findPathOfLeastCost(inputArray: matrixWithZeros)
        //XCTAssertEqual(0, polc?.cost!)
        let nodeTuple = costCalculator?.findLeastCost(inputMatrix: matrixWithZeros)
        XCTAssertEqual(nodeTuple?.cost, 0)
    }
    

    
}
