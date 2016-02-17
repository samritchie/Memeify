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

        /*
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

        }*/
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

