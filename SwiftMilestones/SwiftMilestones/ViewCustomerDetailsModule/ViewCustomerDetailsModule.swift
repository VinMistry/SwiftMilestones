//
//  ViewCustomerDetailsModule.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 29/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class ViewCustomerDetailsModule {
    
    private static let screenName = "View Customer"
    
    func build() -> UIViewController {
        
        let wireframe = ViewCustomerDetailsWireframe()
        
        let interactor = ViewCustomerDetailsInteractor()
        
        let presenter = ViewCustomerDetailsPresenter(wireframe: wireframe, interactor: interactor)
        
        let viewController = ViewCustomerDetailsViewController(eventHandler: presenter)
        
        presenter.view = viewController
        interactor.output = presenter
        wireframe.viewController = viewController
        wireframe.output = presenter
        
        return viewController
    }
}
