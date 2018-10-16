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
    let eventHandler: EventHandler
    let tableView = UITableView()
    var customerProfileList = [CustomerProfile]()
    private let rowHeight: CGFloat = 175.5
    
    init(eventHandler: EventHandler, nibName: String? = nil) {
        self.eventHandler = eventHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = rowHeight
    }
}

extension CustomerListViewController: CustomerListView {
    
}

extension CustomerListViewController:  UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if customerProfileList.isEmpty {
            return 1
        }
        return customerProfileList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var firstName : String
        if !customerProfileList.isEmpty {
            firstName = customerProfileList[indexPath.row].customer.firstName
        } else {
            firstName = ""
        }
        cell.textLabel?.text = firstName
        return cell
    }
}
