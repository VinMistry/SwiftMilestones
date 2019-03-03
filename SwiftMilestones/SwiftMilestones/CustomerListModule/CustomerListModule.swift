//
//  CustomerListModule.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class CustomerListModule {
    
    private static let screenName = "Customer List"
    
    func build() -> UIViewController {
        
        let wireframe = CustomerListWireframe()
        
        let interactor = CustomerListInteractor()
        
        let presenter = CustomerListPresenter(wireframe: wireframe, interactor: interactor)
        
        let viewController = CustomerListViewController(eventHandler: presenter)
        
        presenter.view = viewController
        interactor.output = presenter
        wireframe.viewController = viewController
        wireframe.output = presenter
        
        return viewController
    }
}
