//
//  URLSessionHTTPClient.swift
//  EssentialFeed
//
//  Created by Mendy Edri on 04/11/2019.
//  Copyright © 2019 CWT. All rights reserved.
//

import Foundation

/** Implementation */

public class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    struct UnexpectedValueRepresentation: Error {}
    
    public func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        session.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = response as? HTTPURLResponse {
                completion(.success(data, response))
            } else {
                completion(.failure(UnexpectedValueRepresentation()))
            }
        }).resume()
    }
}
