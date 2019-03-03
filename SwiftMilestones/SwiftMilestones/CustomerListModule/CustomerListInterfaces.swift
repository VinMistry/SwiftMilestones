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
    func passDisplayItems(displayItems: [CustomerDisplayItem])
    func profileSelected()
}

protocol CustomerListEventHandler: EventHandler {
    func viewDidLoad()
    func viewWillAppear()
    func addProfileButtonTapped()
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
    func addCustomerDetails()
    func customerListReturnedEmpty(imageName: String, alertTitle title: String, alertText text: String)
}

protocol CustomerListWireframeOutput: class {
    func customerProfileAdded()
}

