//
//  CustomerListPresenterTests.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 29/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import XCTest
@testable import SwiftMilestones

class CustomerListPresenterTests: XCTestCase {
    
    private var wireframe: MockCustomerListWireframe!
    private var interactor: MockCustomerListInteractor!
    private var view: MockCustomerListView!
    private var presenter: CustomerListPresenter!
    
    override func setUp() {
        super.setUp()
        
        wireframe = MockCustomerListWireframe()
        interactor = MockCustomerListInteractor()
        view = MockCustomerListView()
        
        presenter = CustomerListPresenter(wireframe: wireframe, interactor: interactor)
        
        presenter.view = view
    }
}

// MARK: Mocks

fileprivate class MockCustomerListWireframe: MockWireframe, CustomerListWireframeInput {
    
    func showCustomerDetails() {
        
    }
    
    func addCustomerDetails() {
        
    }
    
    func customerListReturnedEmpty(imageName: String, alertTitle title: String, alertText text: String) {
        
    }
    
    
}

fileprivate class MockCustomerListView: CustomerListView {
    
    func setScreenTitle(with title: String) {
        
    }
    
    func passDisplayItems(displayItems: [CustomerDisplayItem]) {
        
    }
    
    func profileSelected() {
        
    }
    
    
}

fileprivate class MockCustomerListInteractor: CustomerListInteractorInput {
    
    func fetchCustomerProfiles() {
        
    }
    
}
