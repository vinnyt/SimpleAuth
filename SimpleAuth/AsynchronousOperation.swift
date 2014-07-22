//
//  AsynchronousOperation.swift
//  SimpleAuth
//
//  Created by Caleb Davenport on 7/21/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//

import Foundation

public class AsynchronousOperation: NSOperation {
    
    // MARK: - Types
    
    internal enum State {
        case Ready, Executing, Finished
        private func keyPath() -> String {
            switch self {
            case Ready:
                return "isReady"
            case Executing:
                return "isExecuting"
            case Finished:
                return "isFinished"
            }
        }
    }
    
    // MARK: - Properties
    
    private var recursiveLock = NSRecursiveLock()
    private var privateState = State.Ready
    
    internal var state: State {
        get {
            recursiveLock.lock()
            let state = privateState
            recursiveLock.unlock()
            return state
        }
        set {
            recursiveLock.lock()
            
            let oldStateKey = privateState.keyPath()
            let newStateKey = newValue.keyPath()
            
            willChangeValueForKey(newStateKey)
            willChangeValueForKey(oldStateKey)
            
            privateState = state
            
            didChangeValueForKey(oldStateKey)
            didChangeValueForKey(newStateKey)
            
            recursiveLock.unlock()
        }
    }
    
    // MARK: - NSOperation
    
    public override var ready: Bool {
        return state == .Ready
    }
    
    public override var executing: Bool {
        return state == .Executing
    }
    
    public override var finished: Bool {
        return state == .Finished
    }
    
    public override var asynchronous: Bool {
        return true
    }
    
}