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

    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ items: [FeedItem], timestamp: Date, completion: @escaping InsertionCompletion)
}
