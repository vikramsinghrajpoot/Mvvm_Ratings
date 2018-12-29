//
//  RatingTableViewCell.swift
//  Ratings
//
//  Created by Vikram Singh Rajput on 28/12/18.
//  Copyright © 2018 Vikram Singh Rajput. All rights reserved.
//

import UIKit

protocol RatingCellDelegate:class {
    func startDidSelected(rating:Int,cell:UITableViewCell)
}

class RatingTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet var stars: [UIButton]!
    
    weak var delegate:RatingCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(book:Book){
        self.name.text = "Name: \(book.name)"
        self.author.text = "Author: \(book.author)"
        self.rating.text = "Rating: \(book.rating)"
    }
    
    func updateStarts(count:Int){
        for i in 0..<count {
            self.stars[i].setBackgroundImage(UIImage(named: "startActive"), for: .normal)
           // print(i)
        }
    }
    
    override func prepareForReuse() {
        for i in 0..<5 {
            self.stars[i].setBackgroundImage(UIImage(named: "start"), for: .normal)
        }
    }

    @IBAction func startClicked(_ sender: UIButton) {
        self.delegate?.startDidSelected(rating: sender.tag, cell: self)
        self.updateStarts(count: sender.tag)

    }
}

