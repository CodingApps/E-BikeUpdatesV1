//
//  FavoriteViewController.swift
//  EBikeV1-TestA
//
//  Created by Rick Mc on 9/15/18.
//  Copyright © 2018 Rick Mc. All rights reserved.
//

import UIKit
import CoreData

class FavViewController : UITableViewController {
    
    var tableText = Array(repeating: "", count: 20)
    var currentRow : Int = 0
    let textCellIndentifier = "favCell"
    
    var fEntries: [NSManagedObject] = []
    
    @IBOutlet var favTableView: UITableView!
    
    
    override func viewDidLoad() {
        tableView.reloadData()
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
}
