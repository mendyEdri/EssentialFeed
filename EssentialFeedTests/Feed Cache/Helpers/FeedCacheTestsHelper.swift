//
//  FeedCacheTestsHelper.swift
//  EssentialFeedTests
//
//  Created by Mendy Edri on 19/11/2019.
//  Copyright © 2019 CWT. All rights reserved.
//

import XCTest
import EssentialFeed

internal func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
    let models = [uniqueImage(), uniqueImage()]
    let local = models.map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
    return (models, local)
}

internal func uniqueImage() -> FeedImage {
    return FeedImage(id: UUID(), description: "any", location: "any", url: anyURL())
}

internal extension Date {
    
    func minusFeedCacheMaxAge() -> Date {
        return adding(days: -7)
    }
    
    func adding(days: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self)!
    }
    
    func adding(seconds: TimeInterval) -> Date {
        return self + seconds
    }
}
