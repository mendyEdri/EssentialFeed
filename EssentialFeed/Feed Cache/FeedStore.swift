//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Mendy Edri on 12/11/2019.
//  Copyright © 2019 CWT. All rights reserved.
//

import Foundation

public enum RetrievedCachedFeedResult {
    case empty
    case found(feed: [LocalFeedImage], timestamp: Date)
    case failure(error: Error)
}

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    typealias RetrivalCompletion = (RetrievedCachedFeedResult) -> Void
    
    /** The completion handler can be invoked in any thread.
        Clients are responsible to dispatch to appropriate threads, if needed */
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    
    /** The completion handler can be invoked in any thread.
    Clients are responsible to dispatch to appropriate threads, if needed */
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion)
    
    /** The completion handler can be invoked in any thread.
    Clients are responsible to dispatch to appropriate threads, if needed */
    func retrieve(completion: @escaping RetrivalCompletion)
}
