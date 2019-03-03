//
//  Customer.swift
//  SwiftMilestones
//
//  Created by Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import Foundation
struct Customer: Codable, Equatable, Completed {
    
    var firstName: String
    var lastName: String
    
    func isComplete() -> Bool {
        if firstName.isEmpty || lastName.isEmpty || firstName == "" || lastName == "" {
            return false
        }
        return true
    }
}
