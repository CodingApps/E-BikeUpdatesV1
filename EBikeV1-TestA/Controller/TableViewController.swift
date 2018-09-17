//
//  TableViewController.swift
//  EBikeV1-TestA
//
//  Created 9/5/18.
//

import UIKit
import CoreData

class TableViewController : UITableViewController {

   // var tableData : [String] = Array(repeating: "", count: 20)
    static var tableText = Array(repeating: "", count: 20)
    static var urlList = Array(repeating: "", count: 20)
 
    var fEntries: [NSManagedObject] = []
    var searchText : String = ""
    let textCellIndentifier = "feedCell"
    let feedProcess = NewsFeedClient.sharedInstance
    
//    struct feedAdded {
//        static var articleText : String = ""
//        static let articleUrl : String = ""
//    }
    
    static var feedListAdded = [String]()
    static var urlListAdded = [String]()
    
  //  let feedListAdded = [feedAdded]()
    
    @IBOutlet var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayList()
//        if EMotoViewController.titlesLoaded.count != 0 {
//            TableViewController.feedListAdded = EMotoViewController.titlesLoaded
//        }
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(TableViewController.longPress(_:)))
        longPressGesture.minimumPressDuration = 2.0 // 1 second press
        longPressGesture.delegate = self as? UIGestureRecognizerDelegate
        self.tableView.addGestureRecognizer(longPressGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewController.tableText.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIndentifier, for: indexPath as IndexPath)
        cell.textLabel?.text = TableViewController.tableText[indexPath.row]
                return cell
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Favorite") { (action, view, bool) in
            print("Favorite")
            bool(true)
            TableViewController.feedListAdded.append(TableViewController.tableText[indexPath.row])
            TableViewController.urlListAdded.append(TableViewController.urlList[indexPath.row])
            
                self.save(title:TableViewController.tableText[indexPath.row], url:TableViewController.urlList[indexPath.row])
            
        }
//     action.image =  imageLiteral(resourceName: "favourite")
//   feedListAdded[indexPath.row].articleText = self.tableText[indexPath.row]
        

        print(TableViewController.feedListAdded)
        
        action.backgroundColor = UIColor.blue
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }
    
    @objc func longPress(_ longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        if longPressGestureRecognizer.state == UIGestureRecognizerState.began {
            
            let touchPoint = longPressGestureRecognizer.location(in: self.view)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                let urlArticle = TableViewController.urlList[indexPath.row]
                if let urlArticle = URL(string: urlArticle), UIApplication.shared.canOpenURL(urlArticle) {
                    UIApplication.shared.openURL(urlArticle)
                }
                ///////works but erratic responses//////////
            }
        }
    }
    
    func save(title: String, url : String) {
        
        let fEntry = CoreDataStack.sharedManager.insertEntry(title: title, url: url)
        
        if fEntry != nil {
            fEntries.append(fEntry!)
            tableView.reloadData()
        }
    }
    
//    func fetchEntries(){
//        
//        if CoreDataStack.sharedManager.fetchAllEntries() != nil{
//            
//            fEntries = CoreDataStack.sharedManager.fetchAllEntries()!
//        }
//        print("Entries :", fEntries)
//    }
    
    func displayList()
    {
        var textA : String = ""
        
        feedProcess().getListArticles(searchText) { (data, error) in
            
                    let textList = data!["articles"] as! Array<Any>?
                    var articlesList : String = ""
                    var itemText : String = ""
                    print("lookup : ", self.searchText)
                    print(textList)
                    var urlText = Array(repeating: "", count: 20)
                    var titleText = Array(repeating: "", count: 20)
                    for item in 0...19 {
                        let itemText = textList![item] as! [String : Any]
                        print("Record : ", itemText)
                        titleText[item].append(itemText["title"] as! String)
                        urlText[item].append(itemText["url"] as! String)
                            }
                    TableViewController.urlList = urlText
                    TableViewController.tableText = titleText
                    print(TableViewController.tableText)
                    print("TotalAdded :", titleText)
                    print("TotalUrls : ", urlText)
                    DispatchQueue.main.async {
                            self.tableView.reloadData()
                    }
                 }
            }
    
//    class func sharedInstance() -> TableViewController {
//        struct Singleton {
//            static var sharedInstance = TableViewController()
//        }
//        return Singleton.sharedInstance
//    }
    }




