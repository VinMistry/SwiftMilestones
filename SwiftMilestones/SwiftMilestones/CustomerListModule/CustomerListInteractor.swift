//
//  CustomerListInteractor.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class CustomerListInteractor: CustomerListInteractorInput {
    
    weak var output: CustomerListInteractorOutput?
    let endpointInteractor =  EndpointInteractor()
    
    func fetchCustomerProfiles() {
        let customerProfiles = endpointInteractor.retrieveProfiles()
        if customerProfiles.isEmpty {
            output?.customerProfileFetchFailed()
        }
        else {
            output?.fetchedCustomerProfiles(customerProfile: customerProfiles)
        }
    }
}
