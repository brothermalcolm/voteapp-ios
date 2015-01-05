//
//  ViewController.swift
//  VoteApp
//
//  Created by Romans Karpelcevs on 05/01/15.
//  Copyright (c) 2015 Latcraft. All rights reserved.
//

import UIKit

private let kGoodVotesKey = "prefGoodKey"
private let kNeutralVotesKey = "prefNeutralKey"
private let kBadVotesKey = "prefBadKey"

class ViewController: UIViewController {
    @IBOutlet weak var sadFace: UIImageView!
    @IBOutlet weak var neutralFace: UIImageView!
    @IBOutlet weak var happyFace: UIImageView!

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func redTouched() {
        self.animateFace(self.sadFace)
        self.incrementAndStoreScore(kBadVotesKey)
    }

    @IBAction func yellowTouched() {
        self.animateFace(self.neutralFace)
        self.incrementAndStoreScore(kNeutralVotesKey)
    }

    @IBAction func greedTouched() {
        self.animateFace(self.happyFace)
        self.incrementAndStoreScore(kGoodVotesKey)
    }

    func animateFace(image: UIImageView) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            image.transform = CGAffineTransformMakeScale(1.5, 1.5)
        }) { _ in
            image.transform = CGAffineTransformIdentity
        }
    }

    func incrementAndStoreScore(key: String) {
        var currentValue = NSUserDefaults.standardUserDefaults().integerForKey(key)
        ++currentValue
        NSUserDefaults.standardUserDefaults().setInteger(currentValue, forKey: key)
    }
}
