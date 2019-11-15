//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Mendy Edri on 12/11/2019.
//  Copyright © 2019 CWT. All rights reserved.
//

import Foundation

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    typealias RetrivalCompletion = (Error?) -> Void
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion)
    func retrive(completion: @escaping RetrivalCompletion)
}
