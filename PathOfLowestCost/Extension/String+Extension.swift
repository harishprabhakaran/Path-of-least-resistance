//
//  String+Extension.swift
//  PathOfLowestCost
//
//  Created by Harish Prabhakaran on 30/04/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import Foundation

extension String {
    
    
    /// To check if the string contains any character
    /// - Returns: true or false based on condition
    func containsCharacters() -> Bool {
        let letters = CharacterSet.letters
        return self.rangeOfCharacter(from: letters) != nil
    }
    
    /// Forms matrix for the give string
    /// - Returns: Array which contains array of Int elements
    func formMatrix() -> [[Int]] {
        var inputMatrix = [[Int]]()
        var rowCount = 0
        if self.isEmpty {
            return inputMatrix
        } else if self.containsCharacters() {
            return inputMatrix
        }
        
        var rows = self.components(separatedBy: "\n")
        rows = rows.filter { !($0.isEmpty) }

        for row in rows {
            rowCount = rowCount == 0 ? row.count : rowCount
            if rowCount == row.count {
                if !(row.isEmpty || row == " "){
                    var columnArray = [Int]()
                    let column = row.components(separatedBy: " ")
                    for col in column {
                        if !col.isEmpty && Int(col) != nil{
                            columnArray.append(Int(col)!)
                        }
                    }
                    inputMatrix.append(columnArray)
                }
            } else {
                inputMatrix = [[Int]]()
            }
        }
        
        return inputMatrix
    }
}
