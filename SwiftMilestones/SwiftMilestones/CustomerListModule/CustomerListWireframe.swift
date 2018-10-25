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
        viewController?.present(UINavigationController(rootViewController: AddCustomerModule().build()), animated: true, completion: nil)
    }
    
    func customerListReturnedEmpty(imageName: String, alertTitle title: String, alertText text: String) {
        presentAlert(imageName: imageName,alertTitle: title, alertText: text)
    }
    
}
