//
//  RatingViewModel.swift
//  Ratings
//
//  Created by Vikram Singh Rajput on 28/12/18.
//  Copyright © 2018 Vikram Singh Rajput. All rights reserved.
//

import Foundation

protocol RattingDelegate:class {
    func randomUpdateDidFinish(book:Book,index:Int)
}

class RatingViewModel {
    
    var timer:Timer?
    var dataSource = [Book]()
    var isRandomRating = false
    
    weak var delegate:RattingDelegate?
    
    init(delegate:RattingDelegate) {
        self.delegate = delegate
        if let path = Bundle.main.path(forResource: "Data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let books = JSON.JSONObject(data: data) {
                    for b in books {
                        if let b = b as? JSONDic {
                            let book = Book(data: b)
                            self.dataSource.append(book)
                        }
                    }
                }
                
            } catch {
                // handle error
                print("Error in Ratting View model")
            }
        }
        self.sortRatings()
    }
    
    func randomDataSourceJenerator(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            let rating = 5.randomNumber()
            let index = self.dataSource.count.randomNumber()
            var book = self.dataSource[index]
            book.rating = rating
            self.delegate?.randomUpdateDidFinish(book: book, index: index)
        }
    }
    
    func sortRatings(){
        self.dataSource = self.dataSource.sorted(by: { (book1, book2) -> Bool in
            return book1.rating > book2.rating
        })
    }
    
    func updateRandomRatingStatus(){
        if(self.isRandomRating){
            self.isRandomRating = false
            self.timer?.invalidate()
            self.timer = nil
        }else{
            self.isRandomRating = true
            self.randomDataSourceJenerator()

        }
    }
    
}
