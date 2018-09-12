//
//  TableViewController.swift
//  EBikeV1-TestA
//
//  Created 9/5/18.
//

import UIKit

class TableViewController : UITableViewController {

    var tableData : [String] = ["One", "Two"]
    var tableText : String = ""
    let textCellIndentifier = "feedCell"
    let feedProcess = NewsFeedClient.sharedInstance
 //data   let tableView = UITableView()
    @IBOutlet var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    displayList()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("Count total :",  sharedData.sharedInstance.studentLocations.count )
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIndentifier, for: indexPath as IndexPath)
        
        let row = indexPath.row
  //      cell.textLabel?.text = tableData[row]
        cell.textLabel?.text = tableText
        return cell
    }
    
    func displayList()
    {
        var textA : String = ""
        
        feedProcess().getListArticles(textA) { (data, error) in
            
                    let textList = data!["articles"] as! Array<Any>?
                    var articlesList : String = ""
                    var temp : String = ""
                    for item in 1...8 {
                        let temp = textList![item] as! String
                        self.tableText = temp
                        self.tableView.reloadData()
//                        articlesList.append(temp["title"] as! String)
//                 //       print(item)
                    }
                    debugPrint(articlesList)
//                    self.tableText = articlesList
//                    self.tableView.reloadData()
                }
            }
        }
    

