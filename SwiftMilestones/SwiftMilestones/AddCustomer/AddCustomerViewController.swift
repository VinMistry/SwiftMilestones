//
//  AddCustomerViewController.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 17/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class AddCustomerViewController: UIViewController {
    
    let eventHandler: AddCustomerEventHandler
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Initialisers
    init(eventHandler: AddCustomerEventHandler, nibName: String? = nil) {
        self.eventHandler = eventHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddCustomerViewController: AddCustomerView {
    
}
