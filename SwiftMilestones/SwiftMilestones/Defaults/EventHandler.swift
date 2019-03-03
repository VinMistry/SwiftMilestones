//
//  EventHandler.swift
//  SwiftMilestones
//
//  Created by Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import Foundation
protocol EventHandler {
    var defaultWireframe: Wireframe? { get }
    func cancelButtonPressed()
}

extension EventHandler {
    
    func cancelButtonPressed(){
        defaultWireframe?.dismiss()
    }
}
