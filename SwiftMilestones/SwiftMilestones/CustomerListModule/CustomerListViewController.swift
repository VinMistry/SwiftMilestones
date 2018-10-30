//
//  CustomerListViewController.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class CustomerListViewController: UIViewController {
    
    //MARK: Constants
    let eventHandler: CustomerListEventHandler
    let tableView = UITableView()
    var customerDisplayItemList = [CustomerDisplayItem]()
    private let rowHeight: CGFloat = 175.5
    
    //MARK: Initialisers
    init(eventHandler: CustomerListEventHandler, nibName: String? = nil) {
        self.eventHandler = eventHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        setUpTableView()
        eventHandler.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let addCustomerButton = UIBarButtonItem(title: "Add Customer", style: .plain, target: self, action: #selector(addTapped))
        addCustomerButton.tintColor = .green
        self.navigationItem.rightBarButtonItem = addCustomerButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        eventHandler.viewWillAppear()
        tableView.reloadData()
    }
    
    @objc private func addTapped() {
        eventHandler.addProfileButtonTapped()
    }
    
}

extension CustomerListViewController: CustomerListView {
    func setScreenTitle(with title: String) {
        self.title = title
    }
    
    func passDisplayItems(displayItems: [CustomerDisplayItem]) {
        customerDisplayItemList =  displayItems
    }
}

extension CustomerListViewController:  UITableViewDelegate, UITableViewDataSource  {
    
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if customerDisplayItemList.isEmpty {
            return 1
        }
        return customerDisplayItemList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        var firstName : String
        var lastName: String
        if !customerDisplayItemList.isEmpty {
            firstName = customerDisplayItemList[indexPath.row].firstName
            lastName = customerDisplayItemList[indexPath.row].lastName
        } else {
            firstName = ""
            lastName = ""
        }
        cell.textLabel?.text = "👤   \(firstName) \(lastName)"
        return cell
    }
}
