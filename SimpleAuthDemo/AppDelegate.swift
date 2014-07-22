//
//  AppDelegate.swift
//  SimpleAuthDemo
//
//  Created by Caleb Davenport on 7/21/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//

import UIKit
import SimpleAuth

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    
    func configureSimpleAuth() {
        TwitterProvider.configure {
            return TwitterProviderConfiguration(
                consumerKey: "",
                consumerSecret: ""
            )
        }
        
        FacebookProvider.configure {
            return FacebookProviderConfiguration(
                applicationIdentifier: ""
            )
        }
    }
    
    func application(application: UIApplication!, willFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        configureSimpleAuth()
        
        FacebookProvider.authorize(completion: { dictionary, error in
            
        })
        
        return true
    }

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        return true
    }

}

