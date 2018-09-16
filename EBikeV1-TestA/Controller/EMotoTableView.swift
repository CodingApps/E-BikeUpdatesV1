//
//  EMotoTableView.swift
//  EBikeV1-TestA
//
//  Created by Rick Mc on 9/13/18.
//  Copyright © 2018 Rick Mc. All rights reserved.
//

import UIKit

class EMotoViewController : UITableViewController {
    
    // var tableData : [String] = Array(repeating: "", count: 20)
    var tableText = Array(repeating: "", count: 20)
    var productList : [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    var searchList : [String] = ["sony speakers", "samsung speakers", "dolby speakers", "lg speakers", "hitachi speakers", "panasonic speakers", "bose speakers", "sanyo speakers", "yamaha speakers", "pioneer speakers", "jbl speakers", "klipsch"]
    
    var currentRow : Int = 0
    let textCellIndentifier = "itemCell"

    @IBOutlet var EMotoTableView: UITableView!
  
    override func viewDidLoad() {

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productList.count
    }

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: textCellIndentifier, for: indexPath as IndexPath)
    cell.textLabel?.text = productList[indexPath.row]
    return cell
    }
    
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRow = indexPath.row
        print("Text when selected.")
        print(currentRow)
//        performSegue(withIdentifier: "jumpToArticles", sender: self)
        performSegue(withIdentifier: "tabBar", sender: self)

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if segue.destination is TableViewController
//        {
//            let vc = segue.destination as? TableViewController
//            let indexPath = tableView.indexPath
//            vc?.searchText = searchList[currentRow]
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabVc = segue.destination as! UITabBarController
        let navVc = tabVc.viewControllers!.first as! UINavigationController
        let tabviewVc = navVc.viewControllers.first as! TableViewController
        tabviewVc.searchText = searchList[currentRow]

    }
    
    // Have a EBike index which will be used to select button pressed 1-12. When row pressed,
    // it will assign the number to index var, save name of bike string using indexVar and
    // then string can be passed into getArticles. In getArticles, edit client to use string
    // for search.q parameter. This will then return the result on the second table view.
    // Consider tab view for Friday. Look up articles and ask for articles to store a string
    // array to CoreData.
}
