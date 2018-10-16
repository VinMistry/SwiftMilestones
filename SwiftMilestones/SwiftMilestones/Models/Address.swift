//
//  Address.swift
//  SwiftMilestones
//
//  Created by Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import Foundation
public struct Address: Codable, Equatable{
    var postcode: String
    var street: String
    var city: String
    var houseNumber: String
    
}
