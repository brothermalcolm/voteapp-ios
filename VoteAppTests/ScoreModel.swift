//
//  ScoreModel.swift
//  VoteApp
//
//  Created by Romans Karpelcevs on 07/01/15.
//  Copyright (c) 2015 Latcraft. All rights reserved.
//

import UIKit

public class ScoreModel: NSObject {
   let storage = NSUserDefaults.standardUserDefaults()

    public func scoreForType(type: ResultType) -> Int {
        return self.storage.integerForKey(type.key)
    }

    public func storeScore(score: Int, forType type: ResultType) {
        self.storage.setInteger(score, forKey: type.key)
    }

    public func clearData() {
        self.storeScore(0, forType: ResultType.Good)
        self.storeScore(0, forType: ResultType.Neutral)
        self.storeScore(0, forType: ResultType.Bad)
    }
}
