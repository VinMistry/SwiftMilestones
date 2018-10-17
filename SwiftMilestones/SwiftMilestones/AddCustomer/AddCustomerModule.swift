//
//  AddCustomerModule.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 17/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class AddCustomerModule {
    
    private static let screenName = "Add Customer"
    
    func build() -> UIViewController {
        
        let wireframe = AddCustomerWireframe()
        
        let interactor = AddCustomerInteractor()
        
        let presenter = AddCustomerPresenter(wireframe: wireframe, interactor: interactor)
        
        let viewController = AddCustomerViewController(eventHandler: presenter)
        
        presenter.view = viewController
        interactor.output = presenter
        wireframe.viewController = viewController
        wireframe.output = presenter
        
        return viewController
    }
}
