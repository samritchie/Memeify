//
//  ViewController.swift
//  Memify
//
//  Created by Sam Ritchie on 16/02/2016.
//  Copyright © 2016 Realm Inc. All rights reserved.
//

import UIKit
import RealmSwift
import Common
import RealmGridController

class ViewController: RealmGridController, UICollectionViewDelegateFlowLayout {

    override var realm: Realm {
        return try! Realm.sharedRealm()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realm.objects(Meme.self).count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCell", forIndexPath: indexPath)
        as! MemeCell
        
        cell.memeView.meme = realm.objects(Meme.self)[indexPath.row]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2, height: self.view.frame.width / 2)
    }
}

class MemeCell: UICollectionViewCell {
    @IBOutlet var memeView: MemeView!
}