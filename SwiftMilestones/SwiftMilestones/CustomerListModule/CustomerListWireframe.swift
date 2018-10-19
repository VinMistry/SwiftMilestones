//
//  CustomerListWireframe.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class CustomerListWireframe: CustomerListWireframeInput {
    
    weak var viewController: UIViewController?
    weak var output: CustomerListWireframeOutput?
    
    func showCustomerDetails() {
        
    }
    
    func addCustomerDetails() {
       // viewController?.navigationController?.pushViewController(AddCustomerModule().build(), animated: true)
        viewController?.present(UINavigationController(rootViewController: AddCustomerModule().build()), animated: true, completion: nil)
    }
    
    
}
