//
//  Address.swift
//  SwiftMilestones
//
//  Created by Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import Foundation
struct Address: Codable, Equatable, Completeable{

    var postcode: String
    var street: String
    var city: String
    var houseNumber: String
    
    func isComplete() -> Bool {
        if postcode.isEmpty || street.isEmpty || city.isEmpty || houseNumber.isEmpty {
            return false
        }
        else if postcode == "" || street == "" || city == "" || houseNumber == "" {
            return false
        }
        
        return true
    }
    
}
