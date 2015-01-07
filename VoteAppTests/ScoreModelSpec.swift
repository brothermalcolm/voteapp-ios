//
//  ScoreModelSpec.swift
//  VoteApp
//
//  Created by Romans Karpelcevs on 07/01/15.
//  Copyright (c) 2015 Latcraft. All rights reserved.
//

import Quick
import Nimble
import VoteApp

class ScoreModelSpec: QuickSpec {
    let model = ScoreModel()

    override func spec() {
        describe("Score model") {
            it("should reset data") {
                self.model.storeScore(5, forType: ResultType.Good)
                self.model.clearData()
                expect(self.model.scoreForType(ResultType.Good)).to(equal(0))
                expect(self.model.scoreForType(ResultType.Neutral)).to(equal(0))
                expect(self.model.scoreForType(ResultType.Bad)).to(equal(0))
            }

            it("should store and return data") {
                self.model.storeScore(5, forType: ResultType.Good)
                self.model.storeScore(6, forType: ResultType.Neutral)
                self.model.storeScore(7, forType: ResultType.Bad)
                expect(self.model.scoreForType(ResultType.Good)).to(equal(5))
                expect(self.model.scoreForType(ResultType.Neutral)).to(equal(6))
                expect(self.model.scoreForType(ResultType.Bad)).to(equal(7))
            }
        }
    }
}
