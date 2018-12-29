//
//  JSON.swift
//  Ratings
//
//  Created by Vikram Singh Rajput on 28/12/18.
//  Copyright © 2018 Vikram Singh Rajput. All rights reserved.
//

import Foundation

class JSON {
    
    static func JSONObject(data:Data)->JSONArray?{
        var jsonResult:JSONArray?
        do {
            jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? JSONArray ?? nil
           // print(jsonResult)
           
        } catch {
            // handle error
            print("Unable to convert JSON Object")
        }
        return jsonResult
    }
    
}
