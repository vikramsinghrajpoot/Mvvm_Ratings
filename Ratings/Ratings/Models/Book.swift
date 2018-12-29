//
//  Book.swift
//  Ratings
//
//  Created by Vikram Singh Rajput on 28/12/18.
//  Copyright © 2018 Vikram Singh Rajput. All rights reserved.
//

import Foundation

typealias JSONDic = [String:Any]
typealias JSONArray = [Any]

struct Book {
    var name:String
    var author:String
    var rating:Int
    
    
    init(data:JSONDic) {
        self.name = data["name"] as? String ?? "No Name"
        self.author = data["auther"] as? String ?? "No Author"
        self.rating = data["rating"] as? Int ?? 1

    }
    
}
