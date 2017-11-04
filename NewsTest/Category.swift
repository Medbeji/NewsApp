//
//  Category.swift
//  NewsTest
//
//  Created by MedBeji on 04/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import Foundation

//enum Catgory {
//    .politque:
//
//}


struct Category : Decodable {
    let name: String
    let channels: [Channel]
}

