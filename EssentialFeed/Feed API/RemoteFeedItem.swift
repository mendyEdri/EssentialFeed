//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Mendy Edri on 13/11/2019.
//  Copyright © 2019 CWT. All rights reserved.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
