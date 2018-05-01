//
//  InitialViewController.swift
//  PathOfLowestCost
//
//  Created by Harish Prabhakaran on 27/04/18.
//  Copyright © 2018 Harish Prabhakaran. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var inputTextBox: UITextView!
    
    @IBOutlet weak var hasTravelledLabel: UILabel!
    @IBOutlet weak var pathLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    var POLCMATRIX: [[Int]]?
    var costCalculator: LeastCostCalculator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /// UIButton Action
    ///
    /// - Parameter sender: button sender
    @IBAction func calculateLeastPath(_ sender: Any) {
        
        //Validate the user input string
        let validator = MatrixValidator()
        let matrixValue = validator.validateMatrix(with: self.inputTextBox.text)
        
        //Show error if the matrix value is invalid
        if matrixValue.count > 0 {
            self.errorLabel.isHidden = true
            self.POLCMATRIX = matrixValue
            self.calculateLeastCost()
        } else {
            self.resultView.isHidden = true
            self.errorLabel.isHidden = false
        }
    }
    
    /// To calculate the lease cost, path with the given matrix
    func calculateLeastCost() {
        costCalculator = LeastCostCalculator()
        let polc = costCalculator?.findPathOfLeastCost(inputArray: POLCMATRIX!)
        
        /// Display the output in alert.
        if ((polc?.cost) != nil) && ((polc?.path) != nil) {
            
            let hasTravelled = (polc?.hasPathTravelledAllWay)! ? "YES" : "NO"
            let cost = "\(polc?.cost ?? 0)"
            let path = "\(polc?.path ?? [0])"
            
            self.resultView.isHidden = false
            self.costLabel.text = cost
            self.pathLabel.text = path
            self.hasTravelledLabel.text = hasTravelled
        }
    }
}
