//
//  RentViewController.swift
//  rent-calculator
//
//  Created by Julian Mclain on 12/8/18.
//  Copyright © 2018 Julian Mclain. All rights reserved.
//

import UIKit

class roommateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var roommateNameTextLabel: UILabel!
    @IBOutlet weak var roommateCurrentRentTextLabel: UILabel!
}

class RentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Instance variables
    var rentAmount : Double?
    let manager = RoommateDataSource()
    var roommates : [Roommate] = [Roommate]()
    @IBOutlet weak var roommateTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load rent data
        roommates = manager.getRoommates(rentAmount: rentAmount!)
        
        // Setup TableView protocol
        roommateTableView.delegate = self
        roommateTableView.dataSource = self
        
        // Style the table
        roommateTableView.rowHeight = 80
        roommateTableView.alwaysBounceVertical = false

    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // Mark: - TableView Delegate Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roommates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "roommateTableViewCell", for: indexPath) as! roommateTableViewCell
        cell.roommateNameTextLabel?.text = roommates[indexPath.row].name
        cell.roommateCurrentRentTextLabel?.text = "$" + String(format: "%.2f", roommates[indexPath.row].currentRent)
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
}
