//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Mendy Edri on 08/10/2019.
//  Copyright © 2019 CWT. All rights reserved.
//

import Foundation

public final class RemoteFeedLoader {
    private let client: HTTPClient
    private let url: URL
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public enum Result: Equatable {
        case success([FeedItem])
        case failure(Error)
    }

    public init(url: URL = URL(string: "http://a-url.com")!, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case let .success(data, respone):
                completion(FeedItemsMapper.map(data, from: respone))
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
}
