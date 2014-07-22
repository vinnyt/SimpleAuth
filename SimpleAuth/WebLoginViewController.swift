//
//  WebLoginViewController.swift
//  SimpleAuth
//
//  Created by Caleb Davenport on 7/21/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//

import UIKit

class WebLoginViewController: UIViewController, UIWebViewDelegate {

    // MARK: - Properties
    
    let webView: UIWebView
    
    // MARK: - Initializers
    
    init() {
        webView = UIWebView()
        
        super.init(nibName: nil, bundle: nil)
        
        webView.delegate = self
    }

}
