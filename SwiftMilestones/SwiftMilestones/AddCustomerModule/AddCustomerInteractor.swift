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
    private let endpoint = EndpointInteractor()
    private let profileValidator = Validator()
    
    func addProfileToDB(customerProfile: CustomerProfile) {
        if profileValidator.isComplete(toValidate: customerProfile) {
                self.performAdd(customerProfile: customerProfile)
        }
        else {
            output?.profileNotCompleted()
        }
    }
    
    func performAdd(customerProfile: CustomerProfile) {
        EndpointInteractor().addProfile(customerProfile: customerProfile, completion: {(responseHandler, error) in
            guard error == nil, let response = responseHandler else {
                self.output?.profileFailedToAddToDB()
                return
            }
            print(response.responseCode)
            self.output?.profileAddedToDB(customerID: response.customerID)
        })
        
    }
}
