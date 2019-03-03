//
//  AddCustomerWireframe.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 17/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class AddCustomerWireframe: AddCustomerWireframeInput {
    
    
    weak var viewController: UIViewController?
    weak var output: AddCustomerWireframeOutput?
    
    func requestAlert(imageName: String, alertTitle title: String, alertText text: String)
    {
        presentAlert(imageName: imageName, alertTitle: title, alertText: text)
    }
    
}
