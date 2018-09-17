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
    
    let evMotoTypes = ["Alta Motorcycles", "Enegerica Motorcycles", "Zero Motorcycles", "Volta Motorcycles", "Yamaha Motorcycles", "Curtiss Motorcycles", "Honda Motorcycles" ]
    
    let evMotoPicList = ["Bike1","Bike2","Bike3","Bike4","Bike5","Bike6","Bike7"]
    let evMotoList = ["alta, electric", "+energica, +ego", "zero, electric, motorcycle","+volta +electric","+yamaha,+electric,+motorcycle","+curtiss +electric", "honda,+electric,+motorcycle"]
    
    static var titlesLoaded : [String] = []
    static var urlsLoaded : [String] = []
    
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
        loadEntries()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return evMotoTypes.count
    }

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: textCellIndentifier, for: indexPath as IndexPath)
    cell.textLabel?.text = evMotoTypes[indexPath.row]

    cell.imageView?.image = UIImage(named :evMotoPicList[indexPath.row])
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
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = CGFloat()
        height = 135
        return height
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
        tabviewVc.searchText = evMotoList[currentRow]

    }
    
    @objc func fetchEntries(){
        
        if CoreDataStack.sharedManager.fetchAllEntries() != nil{
            
            EMotoViewController.fEntries = CoreDataStack.sharedManager.fetchAllEntries()!
        }
        print("Entries 2 :", EMotoViewController.fEntries)
        }
    
    func loadEntries(){
        let entrycount = EMotoViewController.fEntries.count
        if entrycount != 0 {
            EMotoViewController.titlesLoaded = []
            EMotoViewController.urlsLoaded = []
            for count in 0 ... entrycount-1 {
                
                    EMotoViewController.urlsLoaded.append(EMotoViewController.fEntries[count].value(forKeyPath: "url") as! String)
                    EMotoViewController.titlesLoaded.append(EMotoViewController.fEntries[count].value(forKeyPath: "title") as! String)
            }
            TableViewController.feedListAdded = EMotoViewController.titlesLoaded
            TableViewController.urlListAdded = EMotoViewController.urlsLoaded
        }
        
    }
    
//    @available(iOS 2.0, *)
//    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! emotoCell
//        
//        cell.cellView.layer.cornerRadius = cell.cellView.frame.height/2
//        
//        cell.motoImage.image = UIImage(named : evMotoPicList[indexPath.row])
//        cell.motoLbl.text = evMotoTypes[indexPath.row]
//        
//        cell.motoImage.layer.cornerRadius = cell.motoImage
//            .frame.height / 2
//        
//        
//        
//        return cell
//    }

    
}

