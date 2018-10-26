//
//  ProfileValidator.swift
//  SwiftMilestones
//
//  Created by Vinesh Mistry on 25/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import Foundation

class Validator {

    init() {
    
    }
    
    func isComplete(toValidate: Completeable) -> Bool {
        if toValidate.isComplete() {
            return true
        }
        return false
    }
    
    
}
