//
//  CustomerListInterfaces.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import Foundation

protocol CustomerListView: class {
    func setScreenTitle(with title: String)

}

protocol CustomerListEventHandler: EventHandler {
    func viewDidLoad()
}

protocol CustomerListInteractorInput: class {
     func fetchCustomerProfiles()
}

protocol CustomerListInteractorOutput: class {
    func fetchedCustomerProfiles(customerProfile:[CustomerProfile])
    func customerProfileFetchFailed()
}

protocol CustomerListWireframeInput: Wireframe {
    func showCustomerDetails()
}

protocol CustomerListWireframeOutput: class {
    func customerProfileAdded()
}

