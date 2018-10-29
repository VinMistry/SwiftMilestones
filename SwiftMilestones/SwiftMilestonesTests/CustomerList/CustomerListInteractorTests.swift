//
//  CustomerListInteractorTests.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 29/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import XCTest
@testable import SwiftMilestones

class CustomerListInteractorTests: XCTestCase {
    
    private var output: MockCustomerListInteractorOutput!
    private var interactor: CustomerListInteractor!
    
    override func setUp() {
        super.setUp()
        
        output = MockCustomerListInteractorOutput()
        interactor = CustomerListInteractor()
        interactor.output = output
    }
}

fileprivate class MockCustomerListInteractorOutput: CustomerListInteractorOutput {
    
    func fetchedCustomerProfiles(customerProfile: [CustomerProfile]) {
        
    }
    
    func customerProfileFetchFailed() {
        
    }
    
    
}
