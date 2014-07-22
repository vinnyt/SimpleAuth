//
//  Twitter.swift
//  SimpleAuth
//
//  Created by Caleb Davenport on 7/20/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//

import Foundation

public struct TwitterProviderConfiguration {
    public let consumerKey: String
    public let consumerSecret: String
    public init(consumerKey: String, consumerSecret: String) {
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
    }
}
private var SharedTwitterProviderConfiguration: TwitterProviderConfiguration?
private func GetSharedTwitterProviderConfiguration() -> TwitterProviderConfiguration? {
    var configuration: TwitterProviderConfiguration?
    dispatch_sync(ConfigurationQueue) {
        configuration = SharedTwitterProviderConfiguration
    }
    return configuration
}
private func SetSharedTwitterProviderConfiguration(configuration: TwitterProviderConfiguration?) {
    dispatch_sync(ConfigurationQueue) {
        SharedTwitterProviderConfiguration = configuration
    }
}

public class TwitterProvider: Provider {

    // MARK: - Types
    
    public typealias ConfigurationBlock = (TwitterProviderConfiguration) -> Void
    
    // MARK: - Properties
    
    private let configuration: TwitterProviderConfiguration
    
    // MARK: - Initializers
    
    init() {
        assert(SharedTwitterProviderConfiguration, "[SimpleAuth] The Twitter provider has not been configured.")
        configuration = SharedTwitterProviderConfiguration!
        super.init()
    }
    
    // MARK: - Public
    
    public class func configure(block: ((Void) -> TwitterProviderConfiguration)) {
        SetSharedTwitterProviderConfiguration(block())
    }
    
}
