//
//  MockWireframe.swift
//  MSM_MobileApp_UI
//
//  Created by Joshua Simmons on 23/03/2017.
//  Copyright © 2017 Moneysupermarket.com Limited. All rights reserved.
//

import Foundation
import UIKit
@testable import SwiftMilestones

class MockWireframe: Wireframe {
    
    var didDismiss = false
    var didPop = false
    var systemSettingsDialogShown = false
    var allowPushNotifications = true
    var allowSystemSettings = true
    var isShowingAlert = false
    var numberCalled: String?
    var callAllowed = true
    var textInformationShown: (title: String?, heading: String, subHeading: String?, htmlContentFilename: String, screenName: String)?
   
    var viewController: UIViewController?
    
    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        didDismiss = true
        completion?()
    }
    
    func pop(animated: Bool) {
        didPop = true
    }
    
    func presentOpenSystemSettingsDialog(completion: ((Bool) -> Void)?) {
        systemSettingsDialogShown = true
        completion?(allowSystemSettings)
    }
    
    func call(number: String) {
        numberCalled = number
    }
    
    func canCall(number: String) -> Bool {
        return callAllowed
    }
    
    func presentTextInformationScreen(with title: String?, heading: String, subHeading: String?, contentText: NSAttributedString, screnName: String) {
        
    }
    
    func presentTextInformationScreen(with title: String?, heading: String, subHeading: String?, htmlContentFilename: String, screenName: String) {
        textInformationShown = (title, heading, subHeading, htmlContentFilename, screenName)
    }
    
}
