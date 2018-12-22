//
//  ViewController.swift
//  rent-calculator
//
//  Created by Julian Mclain on 12/8/18.
//  Copyright © 2018 Julian Mclain. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var rentAmount : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblValidationMessage.isHidden = true
    }
    
    @IBOutlet weak var rentAmountField: UITextField!
    @IBOutlet weak var lblValidationMessage: UILabel!
    
    @IBAction func rentAmountEntered(_ sender: UITextField) {
        
        guard let input = rentAmountField.text, isValid(input: input) else {
            lblValidationMessage.isHidden = false
            return
        }
        rentAmount = Double(input)
        performSegue(withIdentifier: "rentSegue", sender: self)
    }
    
    func isValid(input: String) -> Bool {
        if input.count == 0 {
            lblValidationMessage.text = "Enter an amount greater than $6,350"
            return false
        }
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! RentViewController
        destinationVC.rentAmount = rentAmount
    }
}
