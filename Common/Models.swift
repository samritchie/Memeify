//
//  Models.swift
//  Memify
//
//  Created by Sam Ritchie on 16/02/2016.
//  Copyright © 2016 Realm Inc. All rights reserved.
//

import UIKit
import RealmSwift

extension Realm {
    public static func sharedRealm() throws -> Realm {
        guard let path = NSFileManager.defaultManager()
            .containerURLForSecurityApplicationGroupIdentifier("group.com.memeify")?
            .URLByAppendingPathComponent("db.realm")
            .path else { throw NSError(domain: "RealmDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "The App Group Container was not found."]) }
        return try Realm(path: path)
    }
}

public class Meme: Object {
    dynamic var baseImageData = NSData()
    public dynamic var textLineOne = ""
    public dynamic var textLineTwo = ""
    public dynamic var lastModified = NSDate()
    
    override public class func ignoredProperties() -> [String] {
        return ["baseImage", "renderedImage"]
    }
    
    public var baseImage: UIImage {
        get { return UIImage(data: baseImageData)! }
        set { baseImageData = UIImageJPEGRepresentation(newValue, 0.7)! }
    }
    
    public var renderedImage: UIImage {
        get {
            let view = MemeView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
            view.meme = self
            return view.generateImage()
        }
    }
}