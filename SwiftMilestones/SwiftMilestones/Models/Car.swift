//
//  Car.swift
//  SwiftMilestones
//
//  Created by Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import Foundation
struct Car: Codable, Equatable, Completeable {
    
    var make: String
    var model: String
    var engineSize: String
    var registration: String
    
    func isComplete() -> Bool {
        if make.isEmpty || model.isEmpty || engineSize.isEmpty || registration.isEmpty{
            return false
        }
        else if make == "" || model == "" || engineSize == "" || registration == "" {
            return false
        }
        
        return true 
    }
    
}
