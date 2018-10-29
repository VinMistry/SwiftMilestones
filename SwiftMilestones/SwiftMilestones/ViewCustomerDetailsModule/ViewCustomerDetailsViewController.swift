//
//  ViewCustomerDetailsViewController.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 29/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class ViewCustomerDetailsViewController: UIViewController {
    
    let eventHandler: ViewCustomerDetailsEventHandler
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(eventHandler: ViewCustomerDetailsEventHandler, nibName: String? = nil) {
        self.eventHandler = eventHandler
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ViewCustomerDetailsViewController: ViewCustomerDetailsView {
    
}
