//
//  Manageable.swift
//  CoreSwift
//
//  Created by Gian Nucci on 07/03/18.
//  Copyright © 2018 CI&T. All rights reserved.
//

import Foundation

/// All Innstances of Manager layer must extends Manager
open class Manager: OperationQueue {
    
    /// Inicializador
    public override init() {
        super.init()
        name = String(describing: self)
    }
    
    deinit {
        cancelAllOperations()
    }
}
