//
//  FacebookProvider.swift
//  SimpleAuth
//
//  Created by Caleb Davenport on 7/21/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//

import Accounts

public struct FacebookProviderConfiguration {
    public let audience: String
    public let permissions: Array<String>
    public let applicationIdentifier: String
    public init(applicationIdentifier: String) {
        self.applicationIdentifier = applicationIdentifier
        permissions = [ "email" ]
        audience = ACFacebookAudienceFriends
    }
    public init(applicationIdentifier: String, permissions: Array<String>, audience: String) {
        self.applicationIdentifier = applicationIdentifier
        self.permissions = permissions
        self.audience = audience
    }
}
private var SharedFacebookProviderConfiguration: FacebookProviderConfiguration?

public class FacebookProvider: Provider {
    
    // MARK: - Types
    
    public typealias ConfigurationBlock = (TwitterProviderConfiguration) -> Void
    
    // MARK: - Properties
    
    private let configuration: FacebookProviderConfiguration
    
    // MARK: - Initializers
    
    init() {
        assert(SharedFacebookProviderConfiguration, "[SimpleAuth] The Facebook provider has not been configured.")
        configuration = SharedFacebookProviderConfiguration!
        super.init()
    }
   
    // MARK: - Public
    
    public class func configure(block: ((Void) -> FacebookProviderConfiguration)) {
        SharedFacebookProviderConfiguration = block()
    }
    
    public class func authorize(#completion: ((NSDictionary!, NSError!) -> Void)) {
        
    }
    
}
