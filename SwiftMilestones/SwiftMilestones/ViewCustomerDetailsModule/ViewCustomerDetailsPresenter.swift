//
//  ViewCustomerDetailsPresenter.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 29/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class ViewCustomerDetailsPresenter {
    
    private let wireframe: ViewCustomerDetailsWireframeInput
    private let interactor: ViewCustomerDetailsInteractorInput
    
    let defaultWireframe: Wireframe?
    
    weak var view: ViewCustomerDetailsView?

    init(wireframe: ViewCustomerDetailsWireframeInput,
         interactor: ViewCustomerDetailsInteractorInput) {
        
        self.wireframe = wireframe
        self.interactor = interactor
        self.defaultWireframe = wireframe
    }
}

extension ViewCustomerDetailsPresenter: ViewCustomerDetailsEventHandler {
    
}

extension ViewCustomerDetailsPresenter: ViewCustomerDetailsInteractorOutput {
    
}

extension ViewCustomerDetailsPresenter: ViewCustomerDetailsWireframeOutput {
    
}
