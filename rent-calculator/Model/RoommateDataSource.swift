//
//  RoommateDataSource.swift
//  rent-calculator
//
//  Created by Julian Mclain on 12/8/18.
//  Copyright © 2018 Julian Mclain. All rights reserved.
//

import Foundation

class RoommateDataSource {
    var roommates = [Roommate]()
    
    init() {
        roommates = []
        
        let julian = Roommate(name: "Julian 🌱", baseRent: 1700.0)
        roommates.append(julian)
        
        let mike = Roommate(name: "Mike ⛹️‍♂️", baseRent: 1600.0)
        roommates.append(mike)
        
        let raisa = Roommate(name: "Raisa 💁🏾", baseRent: 1400.0)
        roommates.append(raisa)
        
        let kevin = Roommate(name: "Kevin ⚽", baseRent: 1650.0)
        roommates.append(kevin)
    }
    
    func getRoommates(rentAmount: Double) -> [Roommate] {
        let additionalRent = (rentAmount - 6350.0) / 4.0
        for roommate in roommates {
            roommate.currentRent = roommate.baseRent + additionalRent
        }
        return roommates
    }
}
