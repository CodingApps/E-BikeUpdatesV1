//
//  FavoriteViewController.swift
//  EBikeV1-TestA
//
//  Created by Rick Mc on 9/15/18.
//  Copyright © 2018 Rick Mc. All rights reserved.
//

import UIKit

class FavViewController : UITableViewController {
    
    // var tableData : [String] = Array(repeating: "", count: 20)
    var tableText = Array(repeating: "", count: 20)
    var currentRow : Int = 0
    let textCellIndentifier = "favCell"
    var productList : [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    @IBOutlet var favTableView: UITableView!
    
    
    override func viewDidLoad() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var listArticles = TableViewController.feedListAdded
        print(listArticles)
        return listArticles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var listArticles = TableViewController.feedListAdded
        
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIndentifier, for: indexPath as IndexPath)
        cell.textLabel?.text = listArticles[indexPath.row]
        return cell
    }
//    override func viewDidLoad() {
//        var listArticles = articleView().feedListAdded
//        print(TableViewController.urlList)
//   //     self.tableView.reloadData()
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var listArticles = TableViewController.urlList
//        return productList.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIndentifier, for: indexPath as IndexPath)
//        var listArticles = articleView().feedListAdded
//        cell.textLabel?.text = productList[indexPath.row]
//        self.tableView.reloadData()
//        return cell
//    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        currentRow = indexPath.row
//        print("Text when selected.")
//        print(currentRow)
//    }

}
