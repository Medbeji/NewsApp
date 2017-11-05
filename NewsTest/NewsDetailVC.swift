//
//  NewsDetailVC.swift
//  NewsTest
//
//  Created by MedBeji on 04/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import UIKit

class NewsDetailVC: UIViewController {

    var webView : UIWebView = {
       let web = UIWebView()
       return web
    }()
    
    var urlString : String? {
        didSet {
            guard let urlString = urlString else { return }
            if let url = URL(string: urlString) {
                self.webView.loadRequest(URLRequest(url: url))
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupViews()

    }
    
    func setupViews() {
        self.view.addSubview(webView)
        webView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 37, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}
