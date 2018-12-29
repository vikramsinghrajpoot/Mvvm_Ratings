//
//  RandomGenerator.swift
//  Ratings
//
//  Created by Vikram Singh Rajput on 28/12/18.
//  Copyright © 2018 Vikram Singh Rajput. All rights reserved.
//

import Foundation

extension Int {
   func randomNumber()->Int{
    return Int(arc4random_uniform(UInt32(self)))
    }
}

extension Array {
//    mutating func sortRating(){
//        self.sort { (obj1, obj2) -> Bool in
//            return obj1 > obj2
//        }
//    }
}
