//
//  ViewController.swift
//  VoteApp
//
//  Created by Romans Karpelcevs on 05/01/15.
//  Copyright (c) 2015 Latcraft. All rights reserved.
//

import UIKit

private let kAnimationDuration = 0.2
private let kAnimationResizeScale: CGFloat = 1.5

class ViewController: UIViewController {

    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var resultsButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!

    @IBOutlet var resultLabels: [UILabel]!
    @IBOutlet var faces: [UIImageView]!

    @IBOutlet weak var attributionLabel: UILabel!

    private let scoreModel = ScoreModel()

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func greedTouched() {
        self.animateFace(self.faces[ResultType.Good.rawValue])
        self.incrementAndStoreScore(ResultType.Good)
    }

    @IBAction func yellowTouched() {
        self.animateFace(self.faces[ResultType.Neutral.rawValue])
        self.incrementAndStoreScore(ResultType.Neutral)
    }

    @IBAction func redTouched() {
        self.animateFace(self.faces[ResultType.Bad.rawValue])
        self.incrementAndStoreScore(ResultType.Bad)
    }

    func animateFace(image: UIImageView) {
        UIView.animateWithDuration(kAnimationDuration, animations: { () -> Void in
            image.transform = CGAffineTransformMakeScale(kAnimationResizeScale, kAnimationResizeScale)
        }, { _ in
            image.transform = CGAffineTransformIdentity
        })
    }

    func incrementAndStoreScore(resultType: ResultType) {
        var currentValue = self.scoreModel.scoreForType(resultType)
        self.scoreModel.storeScore(++currentValue, forType: resultType)
        self.refreshDisplayedData()
    }

    func refreshDisplayedData() {
        for (index, label) in enumerate(self.resultLabels) {
            label.text = String(self.scoreModel.scoreForType(ResultType(rawValue: index)!))
        }
    }

    @IBAction func infoTapped(sender: UIButton) {
        self.resultsButton.hidden = !self.resultsButton.hidden
        self.clearButton.hidden = !self.clearButton.hidden
        self.attributionLabel.hidden = !self.attributionLabel.hidden
    }

    @IBAction func resultsTapped(sender: UIButton) {
        for label in self.resultLabels {
            label.hidden = !label.hidden
        }
    }

    @IBAction func clearTapped(sender: UIButton) {
        self.scoreModel.clearData()
        self.refreshDisplayedData()
    }
}
