//
//  Category.swift
//  NewsTest
//
//  Created by MedBeji on 04/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import Foundation




struct Sources : Decodable {
    let status: String
    let sources: [Channel]
}



 

struct Category : Decodable {
    let name: String
    var channels: [Channel]?
    
    init(name:String){
        self.name = name
        self.channels = []
    }
    
    init(name: String,channels :[Channel]) {
        self.name = name
        self.channels = channels
    }
}

