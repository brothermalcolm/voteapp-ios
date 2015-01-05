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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func redTouched() {
        self.animateFace(self.sadFace)
    }

    @IBAction func yellowTouched() {
        self.animateFace(self.neutralFace)
    }

    @IBAction func greedTouched() {
        self.animateFace(self.happyFace)
    }

    func animateFace(image: UIImageView) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            image.transform = CGAffineTransformMakeScale(1.5, 1.5)
        }) { _ in
            image.transform = CGAffineTransformIdentity
        }
    }
}
