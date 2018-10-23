//
//  AddCustomerPresenter.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 17/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class AddCustomerPresenter {
    
    private let wireframe: AddCustomerWireframeInput
    private let interactor: AddCustomerInteractorInput
    
    let defaultWireframe: Wireframe?
    
    weak var view: AddCustomerView?

    init(wireframe: AddCustomerWireframeInput,
         interactor: AddCustomerInteractorInput) {
        
        self.wireframe = wireframe
        self.interactor = interactor
        
        self.defaultWireframe = wireframe
    }
}

extension AddCustomerPresenter: AddCustomerEventHandler {
    func addPersonButtonTapped() {
        interactor.addProfileToDB(customerProfile: view!.getProfileFromFields())
    }
}

extension AddCustomerPresenter: AddCustomerInteractorOutput {
    func profileAddedToDB(customerID: String) {
        
    }
    
    func profileFailedToAddToDB() {
        
    }
    
    
}

extension AddCustomerPresenter: AddCustomerWireframeOutput {
    
}
