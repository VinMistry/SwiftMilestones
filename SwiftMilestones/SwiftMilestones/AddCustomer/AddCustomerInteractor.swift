//
//  AddCustomerInteractor.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 17/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class AddCustomerInteractor: AddCustomerInteractorInput {
   
    weak var output: AddCustomerInteractorOutput?
    
    func addProfileToDB(customerProfile: CustomerProfile) {
      let response =  EndpointInteractor().addProfile(customerProfile: customerProfile)
        if response.responseCode == 200 {
            output?.profileAddedToDB(customerID: response.customerID)
        }
    }
    

}
