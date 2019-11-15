//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Mendy Edri on 04/10/2019.
//  Copyright © 2019 CWT. All rights reserved.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
