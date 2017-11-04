//
//  Channel.swift
//  NewsTest
//
//  Created by MedBeji on 04/11/2017.
//  Copyright © 2017 TeamIO. All rights reserved.
//

import Foundation

struct LogoUrl: Decodable {
    let small : String
    let medium : String
    let large: String
}

struct Channel : Decodable {
    let id: String
    let name: String
    let description: String
    let url: URL
    let category: String
    let language: String
    let country: String
    let urlsToLogos: LogoUrl
    let sortBysAvailable: [String]
}
