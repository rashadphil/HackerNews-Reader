//
//  User.swift
//  HackerNewsReader
//
//  Created by Rashad Philizaire on 6/24/22.
//

import Foundation

struct User {
    var id : Int
    var name : String
    var about : String
    var createdAt : Date
    var karma : Int
    
    init() {
        self.id = 0
        self.name = "andsoitis"
        self.about = ""
        self.createdAt = Date()
        self.karma = 0
    }
}
