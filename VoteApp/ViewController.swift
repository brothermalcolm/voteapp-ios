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

enum ResultType: Int {
    case Good = 0
    case Neutral = 1
    case Bad = 2
}

extension ResultType {
    var key: String {
        switch self {
        case .Good:
            return kGoodVotesKey
        case .Neutral:
            return kNeutralVotesKey
        case .Bad:
            return kBadVotesKey
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var sadFace: UIImageView!
    @IBOutlet weak var neutralFace: UIImageView!
    @IBOutlet weak var happyFace: UIImageView!

    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var resultsButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!

    @IBOutlet var resultLabels: [UILabel]!

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func redTouched() {
        self.animateFace(self.sadFace)
        self.incrementAndStoreScore(ResultType.Bad)
    }

    @IBAction func yellowTouched() {
        self.animateFace(self.neutralFace)
        self.incrementAndStoreScore(ResultType.Neutral)
    }

    @IBAction func greedTouched() {
        self.animateFace(self.happyFace)
        self.incrementAndStoreScore(ResultType.Good)
    }

    func refreshDisplayedData() {
        for (index, label) in enumerate(self.resultLabels) {
            label.text = String(self.scoreForType(ResultType(rawValue: index)!))
        }
    }

    @IBAction func infoTapped(sender: UIButton) {
        self.resultsButton.hidden = !self.resultsButton.hidden
        self.clearButton.hidden = !self.clearButton.hidden
    }

    @IBAction func resultsTapped(sender: UIButton) {
        for label in self.resultLabels {
            label.hidden = !label.hidden
        }
    }

    @IBAction func clearTapped(sender: UIButton) {
        self.clearData()
        self.refreshDisplayedData()
    }

    func animateFace(image: UIImageView) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            image.transform = CGAffineTransformMakeScale(1.5, 1.5)
        }) { _ in
            image.transform = CGAffineTransformIdentity
        }
    }

    func incrementAndStoreScore(resultType: ResultType) {
        var currentValue = self.scoreForType(resultType)
        self.storeScore(++currentValue, forType: resultType)
        self.refreshDisplayedData()
    }

    func scoreForType(resultType: ResultType) -> Int {
        return NSUserDefaults.standardUserDefaults().integerForKey(resultType.key)
    }

    func storeScore(score: Int, forType resultType: ResultType) {
        NSUserDefaults.standardUserDefaults().setInteger(score, forKey: resultType.key)
    }

    func clearData() {
        self.storeScore(0, forType: ResultType.Good)
        self.storeScore(0, forType: ResultType.Neutral)
        self.storeScore(0, forType: ResultType.Bad)
    }
}
