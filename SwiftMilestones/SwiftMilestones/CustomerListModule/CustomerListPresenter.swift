//
//  CustomerListPresenter.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class CustomerListPresenter {
    
    private let wireframe: CustomerListWireframeInput
    private let interactor: CustomerListInteractorInput
    
    let defaultWireframe: Wireframe?
    
    weak var view: CustomerListView?
    
    init(wireframe: CustomerListWireframeInput,
         interactor: CustomerListInteractorInput) {
        
        self.wireframe = wireframe
        self.interactor = interactor
        
        self.defaultWireframe = wireframe
    }
}

extension CustomerListPresenter: CustomerListEventHandler {
    
    func viewDidLoad() {
        view?.setScreenTitle(with: "Customer List")
        interactor.fetchCustomerProfiles()
    }
    
    func viewWillAppear() {
        interactor.fetchCustomerProfiles()
    }
    
    
    func addProfileButtonTapped() {
        wireframe.addCustomerDetails()
    }
}

extension CustomerListPresenter: CustomerListInteractorOutput {
    func fetchedCustomerProfiles(customerProfile: [CustomerProfile]) {
        var profiles = [CustomerDisplayItem]()
        for profile in customerProfile {
            if let id = profile.id {
                profiles.append(CustomerDisplayItem(id: id, firstName: profile.customer.firstName, lastName: profile.customer.lastName))
            }
            else {
                profiles.append(CustomerDisplayItem(id: nil, firstName: profile.customer.firstName, lastName: profile.customer.lastName))
            }
        }
        view?.passDisplayItems(displayItems: profiles)
    }
    
    func customerProfileFetchFailed() {
        wireframe.customerListReturnedEmpty(imageName: AlertImage.somethingWentWrong.rawValue, alertTitle: "No Profiles Found", alertText: "No profiles returned from the database")
    }
    
    
}

extension CustomerListPresenter: CustomerListWireframeOutput {
}
