//
//  TodayViewController.swift
//  TodayExtension
//
//  Created by Sam Ritchie on 16/02/2016.
//  Copyright © 2016 Realm Inc. All rights reserved.
//

import UIKit
import NotificationCenter
import RealmSwift
import Common

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet var memeView: MemeView!
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        memeView.meme = realm.objects(Meme.self).sorted("lastModified", ascending: false).first
        completionHandler(NCUpdateResult.NewData)
    }
    
}
