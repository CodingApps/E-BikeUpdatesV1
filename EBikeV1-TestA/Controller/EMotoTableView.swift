//
//  EMotoTableView.swift
//  EBikeV1-TestA
//
//  Created by Rick Mc on 9/13/18.
//  Copyright © 2018 Rick Mc. All rights reserved.
//

import UIKit
import CoreData

class EMotoViewController : UITableViewController {
    
    // var tableData : [String] = Array(repeating: "", count: 20)
    var tableText = Array(repeating: "", count: 20)
    var productList : [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    var searchList : [String] = ["sony speakers", "samsung speakers", "dolby speakers", "lg speakers", "hitachi speakers", "panasonic speakers", "bose speakers", "sanyo speakers", "yamaha speakers", "pioneer speakers", "jbl speakers", "klipsch"]
    
    static var titlesLoaded = [""]
    var currentRow : Int = 0
    let textCellIndentifier = "itemCell"
    
    static var fEntries: [NSManagedObject] = []


    @IBOutlet var EMotoTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        
        // add notification observers
        NotificationCenter.default.addObserver(self, selector: #selector(fetchEntries), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(fetchEntries), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        print("Entries 2 :", EMotoViewController.fEntries)
        let entrycount = EMotoViewController.fEntries.count
        if entrycount != 0 {
            for count in 0 ... entrycount-1 {
                print(EMotoViewController.fEntries[count].value(forKeyPath: "title") as Any)
            }
        }
        if entrycount != 0 {
            EMotoViewController.titlesLoaded = [""]
        for count in 0 ... entrycount-1 {
//            let titletemp = EMotoViewController.fEntries[count].value(forKeyPath: "title") as! String
//            EMotoViewController.titlesLoaded[count] = titletemp
            EMotoViewController.titlesLoaded.append(EMotoViewController.fEntries[count].value(forKeyPath: "title") as! String)
            
            }
            TableViewController.feedListAdded = EMotoViewController.titlesLoaded
        }
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
    print(EMotoViewController.fEntries)
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
    
    @objc func fetchEntries(){
        
        if CoreDataStack.sharedManager.fetchAllEntries() != nil{
            
            EMotoViewController.fEntries = CoreDataStack.sharedManager.fetchAllEntries()!
        }
        print("Entries 2 :", EMotoViewController.fEntries)
        }
    }

