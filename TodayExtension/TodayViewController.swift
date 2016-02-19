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
    lazy var realm = try! Realm.sharedRealm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeView.meme = latestMeme
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        if latestMeme != memeView.meme {
            memeView.meme = latestMeme
            completionHandler(NCUpdateResult.NewData)
        } else {
            completionHandler(NCUpdateResult.NoData)
        }
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
    
    var latestMeme: Meme? {
        return realm.objects(Meme.self).sorted("lastModified", ascending: false).first
    }
}
