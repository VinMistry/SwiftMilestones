//
//  AddCustomerTableViewController.swift
//  SwiftMilestones
//
//  Created by Vinesh Mistry on 22/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class AddCustomerTableViewController: UITableViewController {

     var eventHandler: AddCustomerEventHandler!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var houseNumberTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Profile"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.isTranslucent = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
}

extension AddCustomerTableViewController: AddCustomerView {
    
}
