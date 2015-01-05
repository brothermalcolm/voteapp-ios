//
//  ResultType.swift
//  VoteApp
//
//  Created by Romans Karpelcevs on 05/01/15.
//  Copyright (c) 2015 Latcraft. All rights reserved.
//

import UIKit

private let kGoodVotesKey = "prefGoodKey"
private let kNeutralVotesKey = "prefNeutralKey"
private let kBadVotesKey = "prefBadKey"

public enum ResultType: Int {
    case Good = 0
    case Neutral = 1
    case Bad = 2
}

extension ResultType {
    public var key: String {
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