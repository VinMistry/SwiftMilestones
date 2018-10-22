//
//  AddCustomerViewController.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 17/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class AddCustomerViewController: UIViewController, UITextFieldDelegate{
    
    let eventHandler: AddCustomerEventHandler
    let textFieldTop = UITextField(frame: .zero)
    let textFieldBottom = UITextField(frame: .zero)
    let tableView = UITableView()
    private let rowHeight: CGFloat = 175.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Profile"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.isTranslucent = false
//        textFieldTop.borderStyle = .roundedRect
//        textFieldBottom.borderStyle = .roundedRect
//        textFieldBottom.translatesAutoresizingMaskIntoConstraints = false
//        textFieldTop.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(textFieldBottom)
//        self.view.addSubview(textFieldTop)
//        self.view.addConstraints(generateConstraintsTextFieldBottom())
//        self.view.addConstraints(generateConstraintsTextFieldTop())
        self.view.addSubview(tableView)
        setUpTableView()

    }
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = rowHeight
    }
    
    //MARK: Initialisers
    init(eventHandler: AddCustomerEventHandler, nibName: String? = nil) {
        self.eventHandler = eventHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func generateConstraintsTextFieldBottom() -> [NSLayoutConstraint] {
        let constraintTop = NSLayoutConstraint(item: textFieldBottom, attribute: .top, relatedBy: .equal, toItem: textFieldTop, attribute: .bottom, multiplier: 1.0, constant: 8.0)
        let constraintLeading = NSLayoutConstraint(item: textFieldBottom, attribute: .leading, relatedBy: .equal, toItem: textFieldTop, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let constraintTrailing = NSLayoutConstraint(item: textFieldBottom, attribute: .trailing, relatedBy: .equal, toItem: textFieldTop, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        
        return [constraintTop, constraintLeading, constraintTrailing]
    }
    
    private func generateConstraintsTextFieldTop() -> [NSLayoutConstraint] {
        let constraintTop = NSLayoutConstraint(item: textFieldBottom, attribute: .top, relatedBy: .equal, toItem: textFieldTop, attribute: .bottom, multiplier: 1.0, constant: 8.0)
        let constraintLeading = NSLayoutConstraint(item: textFieldBottom, attribute: .leading, relatedBy: .equal, toItem: textFieldTop, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let constraintTrailing = NSLayoutConstraint(item: textFieldBottom, attribute: .trailing, relatedBy: .equal, toItem: textFieldTop, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        
        return [constraintTop, constraintLeading, constraintTrailing]
    }
}

extension AddCustomerViewController: AddCustomerView {
    
}

extension AddCustomerViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 2
        }
        else {
            return 4
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Name"
        }
        else if section == 1 {
            return "Address"
        }
        else {
            return "Car"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AddCustomerTableViewCell()
        return cell
    }
    
    
}
