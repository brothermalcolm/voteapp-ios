//
//  VoteAppTests.swift
//  VoteAppTests
//
//  Created by Romans Karpelcevs on 05/01/15.
//  Copyright (c) 2015 Latcraft. All rights reserved.
//

import Quick
import Nimble
import VoteApp

class ResultTypeSpec: QuickSpec {
    override func spec() {
        describe("Result Type extension") {
            it("should return correct integers as raw values") {
                expect(ResultType.Good.rawValue).to(equal(0))
                expect(ResultType.Neutral.rawValue).to(equal(1))
                expect(ResultType.Bad.rawValue).to(equal(2))
            }

            it("should return correct key for each result") {
                expect(ResultType.Good.key).to(equal("prefGoodKey"))
                expect(ResultType.Neutral.key).to(equal("prefNeutralKey"))
                expect(ResultType.Bad.key).to(equal("prefBadKey"))
            }
        }
    }
}
