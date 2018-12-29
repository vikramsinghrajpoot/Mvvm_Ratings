//
//  ViewController.swift
//  Ratings
//
//  Created by Vikram Singh Rajput on 28/12/18.
//  Copyright © 2018 Vikram Singh Rajput. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel:RatingViewModel?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.viewModel = RatingViewModel(delegate: self)
    }
    
    @IBAction func giveRandamRating(_ sender: UIButton) {
        self.viewModel?.updateRandomRatingStatus()
    }
}


extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.dataSource.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatingTableViewCell") as! RatingTableViewCell
        cell.delegate = self
        if let book = self.viewModel?.dataSource[indexPath.row] {
        cell.updateStarts(count: book.rating)
        cell.configureCell(book: book)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController:RattingDelegate,RatingCellDelegate{
    func startDidSelected(rating: Int, cell: UITableViewCell) {
        //(cell as? RatingTableViewCell)?.updateStarts(count: rating)
        let indexPath = self.tableView.indexPath(for: cell)
        let index = indexPath!.row
        var book = self.viewModel?.dataSource[index]
        if  book != nil {
            book?.rating = rating
            self.viewModel?.dataSource.remove(at: index)
            self.viewModel?.dataSource.insert(book!, at: index)
            self.viewModel?.sortRatings()
            //tableView.reloadRows(at: [indexPath!], with: .top)
            self.tableView.reloadData()
        }
    }
    
    func randomUpdateDidFinish(book: Book, index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        self.viewModel?.dataSource.remove(at: index)
        self.viewModel?.dataSource.insert(book, at: index)
        self.viewModel?.sortRatings()
        self.tableView.reloadData()
        //tableView.reloadRows(at: [indexPath], with: .top)
        //print("Show timer update",index,book.rating)
    }
    
}
