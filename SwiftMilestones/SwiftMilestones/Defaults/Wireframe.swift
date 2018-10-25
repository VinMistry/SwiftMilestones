//
//  Wireframe.swift
//  SwiftMilestones
//
//  Created by Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import Foundation
import UIKit

protocol Wireframe: class {
    var viewController: UIViewController? { get }
    
    func pop(animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
    func dismiss()
    func presentAlert(imageName: String, alertTitle title: String, alertText text: String)
}

extension Wireframe {
    func pop(animated: Bool = true){
        guard let navigationController = viewController?.navigationController else { return }
        navigationController.popViewController(animated: animated)
    }
    
    func dismiss(){
        dismiss(animated: true, completion: nil)
    }
    
    
    func dismiss(animated: Bool, completion: (() -> Void)?) {
        viewController?.dismiss(animated: animated, completion: completion)
    }
    
    func presentAlert(imageName: String, alertTitle title: String, alertText text: String) {
        let customAlert =  CustomAlertViewController(imageName: imageName, alertTitle: title, alertText: text)
        customAlert.providesPresentationContextTransitionStyle = true
        customAlert.definesPresentationContext = true
        customAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        viewController?.present(customAlert, animated: true, completion: nil)
    }
}
