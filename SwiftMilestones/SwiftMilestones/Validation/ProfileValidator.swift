//
//  ProfileValidator.swift
//  SwiftMilestones
//
//  Created by Vinesh Mistry on 25/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import Foundation

class ProfileValidator {

    init() {
    
    }
    
    func isProfileComplete(customerProfile: CustomerProfile) -> Bool {
        if customerProfile.customer.isComplete() && customerProfile.address.isComplete() && customerProfile.car.isComplete() {
            return true
        }
        return false
    }
    
    
}
