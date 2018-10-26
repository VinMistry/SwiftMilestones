//
//  CustomerProfile.swift
//  SwiftMilestones
//
//  Created by Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import Foundation
struct CustomerProfile: Codable, Equatable, Completeable{
    var id: String?
    var customer: Customer
    var address: Address
    var car: Car
    
    init(customer: Customer, address: Address, car: Car) {
        self.customer = customer
        self.address = address
        self.car = car
    }
    
    func isComplete() -> Bool {
        if customer.isComplete() && address.isComplete() && car.isComplete() {
            return true
        }
        return false
    }
}
