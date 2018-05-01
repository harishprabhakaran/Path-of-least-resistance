//
//  MatrixValidator.swift
//  PathOfLowestCost
//
//  Created by Harish Prabhakaran on 30/04/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import Foundation
import UIKit

class MatrixValidator {
    
    var inputMatrix: String = ""
    
    init() {
    }
    
    /// Gets the input string and parses as Valid Matrix
    ///
    /// - Parameter inputMatrixValue: input string
    /// - Returns: Array which contains array of int elements
    func validateMatrix(with inputMatrixValue: String) -> [[Int]]{
        self.inputMatrix = inputMatrixValue
        return inputMatrix.formMatrix()
    }
}
