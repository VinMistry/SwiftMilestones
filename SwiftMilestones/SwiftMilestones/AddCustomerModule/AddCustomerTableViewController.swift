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
    var headerNames: [String]?
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var houseNumberTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var postcodeTextField: UITextField!
    @IBOutlet weak var carMakeTextField: UITextField!
    @IBOutlet weak var carModelTextField: UITextField!
    @IBOutlet weak var carEngineSizeTextField: UITextField!
    @IBOutlet weak var carRegistrationTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Profile"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.isTranslucent = false
        makeDelegateForAllTextFields()
        setUpNavigationButtomItems()
        eventHandler.viewDidLoad()
        
    }
    
    private func setUpNavigationButtomItems() {
        let saveBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self , action: #selector(addButtonTapped))
        saveBarButtonItem.tintColor = .green
        self.navigationItem.rightBarButtonItem = saveBarButtonItem
        
        let cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self , action: #selector(cancelButtonTapped))
        cancelBarButtonItem.tintColor = .red
        self.navigationItem.leftBarButtonItem = cancelBarButtonItem
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let view = UIView()
        view.backgroundColor = .black
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = true
        let sectionName = headerNames?[section] ?? ""
        nameLabel.text = sectionName
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 10, y: 5, width: nameLabel.intrinsicContentSize.width, height:  nameLabel.intrinsicContentSize.height)
        nameLabel.textColor = .white
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    @objc func addButtonTapped() {
        eventHandler.addPersonButtonTapped()
    }
    
    @objc func cancelButtonTapped() {
        eventHandler.cancelButtonTapped()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

extension AddCustomerTableViewController: AddCustomerView {
    func setSectionHeaders(headerNames: [String]) {
        self.headerNames = headerNames
    }
    
    func getProfileFromFields() -> CustomerProfile {
        let customer = Customer(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!)
        let address = Address(postcode: postcodeTextField.text!, street: streetTextField.text!, city: cityTextField.text!, houseNumber: houseNumberTextField.text!)
        let car = Car(make: carMakeTextField.text!, model: carModelTextField.text!, engineSize: carEngineSizeTextField.text!, registration: carRegistrationTextField.text!)
        return CustomerProfile(customer: customer, address: address, car: car)
    }
    
}

extension AddCustomerTableViewController: UITextFieldDelegate {
    
    func makeDelegateForAllTextFields(){
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        houseNumberTextField.delegate = self
        streetTextField.delegate = self
        cityTextField.delegate = self
        postcodeTextField.delegate = self
        carMakeTextField.delegate = self
        carModelTextField.delegate = self
        carEngineSizeTextField.delegate = self
        carRegistrationTextField.delegate = self
    }
    
}
