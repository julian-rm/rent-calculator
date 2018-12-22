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
        if let input = Double(rentAmountField.text!) {
            rentAmount = input
            lblValidationMessage.isHidden = true
            performSegue(withIdentifier: "rentSegue", sender: self)
        } else {
            lblValidationMessage.isHidden = false
            lblValidationMessage.text = "Enter an amount greater than $6,350"
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! RentViewController
        destinationVC.rentAmount = rentAmount
    }
}
