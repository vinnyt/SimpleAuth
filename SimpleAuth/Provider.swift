//
//  Provider.swift
//  SimpleAuth
//
//  Created by Caleb Davenport on 7/21/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//

import Foundation

internal let ConfigurationQueue = dispatch_queue_create("", DISPATCH_QUEUE_SERIAL)

public protocol ProviderConfigurationProtocol {
    
}

public protocol ProviderProtocol {
    class func configure <T : ProviderConfigurationProtocol> (block: ((T) -> Void))
}

public class Provider: AsynchronousOperation {
   
}
