//
//  MemeView.swift
//  Memify
//
//  Created by Sam Ritchie on 16/02/2016.
//  Copyright © 2016 Realm Inc. All rights reserved.
//

import UIKit

public class MemeView: UIView {
    var backgroundImage: UIImageView!
    var lineOneLabel: MemeLabel!
    var lineTwoLabel: MemeLabel!
    
    public var meme: Meme? {
        didSet {
            backgroundImage.image = meme?.baseImage
            lineOneLabel.memeText = meme?.textLineOne
            lineTwoLabel.memeText = meme?.textLineTwo
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        backgroundImage = UIImageView()
        backgroundImage.contentMode = .ScaleAspectFill
        lineOneLabel = MemeLabel()
        lineTwoLabel = MemeLabel()
        addSubview(backgroundImage)
        addSubview(lineOneLabel)
        addSubview(lineTwoLabel)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        lineOneLabel.translatesAutoresizingMaskIntoConstraints = false
        lineTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v": backgroundImage]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[v]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v": backgroundImage]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[v]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v": lineOneLabel]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[v]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v": lineOneLabel]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[v]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v": lineTwoLabel]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[v]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v": lineTwoLabel]))
    }
    
    public func generateImage() -> UIImage {
        UIGraphicsBeginImageContext(self.bounds.size);
        self.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

class MemeLabel: UILabel {
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        adjustsFontSizeToFitWidth = true
        baselineAdjustment = .AlignCenters
        textAlignment = .Center

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var memeText: String? {
        get {
            return attributedText?.string
        }
        set {
            if let text = newValue {
                self.attributedText = NSAttributedString(string: text.uppercaseString, attributes: [
                    NSFontAttributeName: UIFont(name: "Antonio-Bold", size: 48.0)!,
                    NSStrokeColorAttributeName: UIColor.blackColor(),
                    NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSStrokeWidthAttributeName: -3
                ])
            } else {
                self.attributedText = nil
            }
        }
    }
}
