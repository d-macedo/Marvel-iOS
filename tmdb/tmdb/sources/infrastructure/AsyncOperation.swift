//
//  AsyncOperation.swift
//  CoreSwift
//
//  Created by Gian Nucci on 07/03/18.
//  Copyright © 2018 CI&T. All rights reserved.
//

import Foundation

/// Deve-se sobrescrever o main() obrigatoriamente para realizar a lógica da operação
/// Business objects que implementam tasks assincronas devem herdar AsyncOperation
open class AsyncOperation: Operation {
    
    // MARK: - Private Types
    
    /// Estados para AsyncOperation
    private enum State: String {
        case ready = "Ready"
        case executing = "Executing"
        case finished = "Finished"
        case cancelled = "Cancelled"
        fileprivate var key: String { return "is" + self.rawValue }
    }
    
    // MARK: - Private Properties
    
    private var state: State = .ready {
        willSet {
            willChangeValue(forKey: state.key)
            willChangeValue(forKey: newValue.key)
        }
        didSet {
            didChangeValue(forKey: state.key)
            didChangeValue(forKey: oldValue.key)
        }
    }
    
    // MARK: - Public Properties
    
    /// Define se o operação está pronta para execução
    public final override var isReady: Bool { return state == .ready && super.isReady }
    
    /// Define se a operação está executando
    public final override var isExecuting: Bool { return state == .executing }
   
    /// Define se a operação está finalizada
    public final override var isFinished: Bool { return state == .finished }
    
    /// Define se a operação foi cancelada
    public final override var isCancelled: Bool { return state == .cancelled }
    
    /// Define que a operação é assincrona
    public final override var isAsynchronous: Bool { return true }
    
    // MARK: - Operation Overrides
    
    /// Inicio de execução de operações assíncronas
    public override final func start() {

        if isCancelled {
            state = .finished
            return
        }

        state = .executing
        main()
    }

    /// Subclasses devem implementar esse método
    /// super não deve ser chamado
    open override func main() {
        if isCancelled {
            state = .finished
        } else {
            state = .executing
        }
    }
    
    // MARK: - Public
    
    /// Deve ser chamado para finalizar uma operação em andamento
    public final func finish() {
        state = .finished
    }
}
