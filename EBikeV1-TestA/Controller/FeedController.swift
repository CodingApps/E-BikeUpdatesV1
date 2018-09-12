//
//  CollectionViewController.swift
//  EBikeV1-TestA
//
//  Created by Rick Mc on 9/8/18.
//  Copyright © 2018 Rick Mc. All rights reserved.
//

import UIKit

class FeedController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textDisplay: UITextView!
    
    let feedProcess = NewsFeedClient.sharedInstance
    var inputText = ["1", "2"]
    override func viewDidLoad(){
        super.viewDidLoad()
        
        textDisplay.delegate = self
        feedProcess().searchFeedsB()
        searchFeedsA()
    }

    
    func searchFeedsA() {
        var textA : String = "Stuff"
        feedProcess().getListArticles(textA) { (data, error) in
            print("Returned article info :", data)
                let textList = data!["articles"] as! Array<Any>?
                var articlesList : String = ""
                for item in 1...8 {
                    let temp = textList![item] as! [String:Any]
                    articlesList.append(temp["title"] as! String)
                    articlesList.append(temp["url"] as! String)
                    print("searchFeeds Text : ", textList)
            }
  //          return articlesList
            print("List : ", articlesList)
            DispatchQueue.main.async {
                self.textDisplay.text = articlesList
            }
 //           callback(articlesList)
        }
        
    }
  

    
    
    
    
}

