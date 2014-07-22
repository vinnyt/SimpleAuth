//
//  ACAccountStore+SimpleAuth.swift
//  SimpleAuth
//
//  Created by Caleb Davenport on 7/21/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//

import Foundation
import Accounts

let SharedAccountStore = ACAccountStore()

extension ACAccountStore {
    class func SimpleAuth_accountsWithTypeIdentifier(typeIdentifier: String, options: NSDictionary!, completion: ((Array<ACAccount>) -> Void)) {
        let type = SharedAccountStore.accountTypeWithAccountTypeIdentifier(typeIdentifier)
        SharedAccountStore.requestAccessToAccountsWithType(type, options: options, completion: { granted, error in
            if granted {
                if let accounts = SharedAccountStore.accountsWithAccountType(type) {
                    if accounts.count > 0 {
                        
                    }
                    else {
                        
                    }
                }
                else {
                    
                }
            }
            else {
                
            }
        })
    }
}
