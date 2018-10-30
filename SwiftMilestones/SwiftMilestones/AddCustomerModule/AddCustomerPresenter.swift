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
    private let sectionNames = ["Name", "Address", "Car Details"]
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
   
    func viewDidLoad() {
        view?.setSectionHeaders(headerNames: sectionNames)
    }
    
    func cancelButtonTapped() {
        wireframe.dismiss()
    }
    
    func addPersonButtonTapped() {
        interactor.addProfileToDB(customerProfile: view!.getProfileFromFields())
    }
}

extension AddCustomerPresenter: AddCustomerInteractorOutput {
    func profileAddedToDB(customerID: String) {
        wireframe.dismiss()
    }
    
    func profileFailedToAddToDB() {
        wireframe.requestAlert(imageName: AlertImage.somethingWentWrong.rawValue, alertTitle: "Failed To Add Profile", alertText: "Please check your connection and try again!")
    }
    
    func profileNotCompleted() {
        wireframe.requestAlert(imageName: AlertImage.incomplete.rawValue , alertTitle: "Incomplete Profile", alertText: "Please check you've filled out all the fields")
    }
    
}

extension AddCustomerPresenter: AddCustomerWireframeOutput {
    
}
