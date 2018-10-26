//
//  ValidationForProfiles.swift
//  SwiftMilestonesTests
//
//  Created by Vinesh Mistry on 25/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import XCTest
@testable import SwiftMilestones

class ValidationForProfiles: XCTestCase {

    private var profileValidator: Validator?
    
     private var profileWithEmptyAddressString = CustomerProfile(customer: Customer(firstName: "Chris", lastName: "Jones"), address: Address(postcode: "", street: "str", city: "cit", houseNumber: "21W"), car: Car(make: "make", model: "model", engineSize: "2", registration: "bbwwb"))
    
      private var profileWithEmptyNameString = CustomerProfile(customer: Customer(firstName: "Chris", lastName: ""), address: Address(postcode: "vsdbwej", street: "str", city: "cit", houseNumber: "21W"), car: Car(make: "make", model: "model", engineSize: "2", registration: "bbwwb"))
    
    private var completeProfile = CustomerProfile(customer: Customer(firstName: "Chris", lastName: "Jones"), address: Address(postcode: "post", street: "str", city: "cit", houseNumber: "21W"), car: Car(make: "make", model: "model", engineSize: "2", registration: "fbbgdd"))
    
    private var profileWithEmptyCarString = CustomerProfile(customer: Customer(firstName: "Chris", lastName: "Jones"), address: Address(postcode: "post", street: "str", city: "cit", houseNumber: "21W"), car: Car(make: "", model: "model", engineSize: "2", registration: "fbbgdd"))
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        profileValidator = Validator()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProfileContainsEmptyAddressValue() {
        XCTAssert(profileValidator!.isProfileComplete(customerProfile: profileWithEmptyAddressString) == false)
    }
    
    func testProfileContainsEmptyNameValue() {
        XCTAssert(profileValidator!.isProfileComplete(customerProfile: profileWithEmptyNameString) == false)
    }
    
    func testProfileContainsEmptyCarValue() {
        XCTAssert(profileValidator!.isProfileComplete(customerProfile: profileWithEmptyCarString) == false)
    }
    
    func testProfileContainsNoEmptyValues(){
        XCTAssert(profileValidator!.isProfileComplete(customerProfile: completeProfile) == true)
    }


}
