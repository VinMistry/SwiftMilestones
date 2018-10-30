//
//  AddCustomerInterfaces.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 17/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import Foundation

protocol AddCustomerView: class {
    func getProfileFromFields() -> CustomerProfile
    func setSectionHeaders(headerNames: [String])
}

protocol AddCustomerEventHandler: EventHandler {
    func viewDidLoad()
    func addPersonButtonTapped()
    func cancelButtonTapped()
}

protocol AddCustomerInteractorInput: class {
    func addProfileToDB(customerProfile: CustomerProfile)
}

protocol AddCustomerInteractorOutput: class {
    func profileAddedToDB(customerID: String)
    func profileFailedToAddToDB()
    func profileNotCompleted()
}

protocol AddCustomerWireframeInput: Wireframe {
    func requestAlert(imageName: String, alertTitle title: String, alertText text: String)
}

protocol AddCustomerWireframeOutput: class {
    
}

