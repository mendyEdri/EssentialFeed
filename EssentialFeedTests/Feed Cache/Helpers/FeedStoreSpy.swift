//
//  FeedStoreSpy.swift
//  EssentialFeedTests
//
//  Created by Mendy Edri on 15/11/2019.
//  Copyright © 2019 CWT. All rights reserved.
//

import Foundation
import EssentialFeed

class FeedStoreSpy: FeedStore {
    
    enum ReceivedMessages: Equatable {
        case deleteCachedFeed
        case insert([LocalFeedImage], Date)
        case retrive
    }
    
    private(set) var receivedMessages = [ReceivedMessages]()
    
    private var deletionCompletions = [DeletionCompletion]()
    private var insertionCompletions = [InsertionCompletion]()
    private var retrivalCompletions = [RetrivalCompletion]()
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        deletionCompletions.append(completion)
        receivedMessages.append(.deleteCachedFeed)
    }
    
    func completeDeletion(with error: Error, at index: Int = 0) {
        deletionCompletions[index](error)
    }
    
    func completeDeletionSuccessfuly(at index: Int = 0) {
        deletionCompletions[index](nil)
    }
    
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        insertionCompletions.append(completion)
        receivedMessages.append(.insert(feed, timestamp))
    }
    
    func completeInsertion(with error: Error, at index: Int = 0) {
        insertionCompletions[index](error)
    }
    
    func completeSuccessfuly(at index: Int = 0) {
        insertionCompletions[index](nil)
    }
    
    func retrive(completion: @escaping RetrivalCompletion) {
        retrivalCompletions.append(completion)
        receivedMessages.append(.retrive)
    }
    
    func completeRetrival(with error: Error, at index: Int = 0) {
        retrivalCompletions[index](error)
    }
    
    func completeRetrivalWithEmptyCache(at index: Int = 0) {
        retrivalCompletions[index](nil)
    }
}
