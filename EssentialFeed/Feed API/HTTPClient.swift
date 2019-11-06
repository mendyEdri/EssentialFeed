//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Mendy Edri on 17/10/2019.
//  Copyright © 2019 CWT. All rights reserved.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
