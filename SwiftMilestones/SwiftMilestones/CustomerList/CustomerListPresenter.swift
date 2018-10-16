//
//  CustomerListPresenter.swift
//  SwiftMilestones
//
//  Created Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class CustomerListPresenter {
    
    private let wireframe: CustomerListWireframeInput
    private let interactor: CustomerListInteractorInput
    
    let defaultWireframe: Wireframe?
    
    weak var view: CustomerListView?

    init(wireframe: CustomerListWireframeInput,
         interactor: CustomerListInteractorInput) {
        
        self.wireframe = wireframe
        self.interactor = interactor
        
        self.defaultWireframe = wireframe
    }
}

extension CustomerListPresenter: CustomerListEventHandler {
    
}

extension CustomerListPresenter: CustomerListInteractorOutput {
    
}

extension CustomerListPresenter: CustomerListWireframeOutput {
    
}
