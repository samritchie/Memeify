//
//  AppDelegate.swift
//  Memify
//
//  Created by Sam Ritchie on 16/02/2016.
//  Copyright © 2016 Realm Inc. All rights reserved.
//

import UIKit
import RealmSwift
import Common

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var realm = try! Realm.sharedRealm()

    var window: UIWindow?
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        if realm.objects(Meme.self).isEmpty {
            generateTestData()
        }

        return true
    }

    func generateTestData() {
        try! realm.write {
            var meme = Meme()
            meme.baseImage = UIImage(named: "Y-U-No")!
            meme.textLineOne = "Xcode"
            meme.textLineTwo = "Y U No run"
            realm.add(meme)
            meme = Meme()
            meme.baseImage = UIImage(named: "Captain-Picard-Facepalm")!
            meme.textLineTwo = "iTunes Connect"
            realm.add(meme)
            meme = Meme()
            meme.baseImage = UIImage(named: "One-Does-Not-Simply")!
            meme.textLineOne = "One Does Not Simply"
            meme.textLineTwo = "Extend a Protocol"
            realm.add(meme)
            meme = Meme()
            meme.baseImage = UIImage(named: "X-All-The-Y")!
            meme.textLineOne = "Swift"
            meme.textLineTwo = "All the Things!"
            realm.add(meme)
        }
    }
}

