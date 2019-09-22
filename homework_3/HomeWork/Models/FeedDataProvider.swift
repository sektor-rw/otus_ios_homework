//
//  FeedDataProvider.swift
//  HomeWork
//
//  Created by Kolya on 18/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

protocol FeedDataProvider {
    func getFeeds() -> [Feed]
}

struct Feed {
    struct Item {
        let title: String
        let color: UIColor
    }
    
    let title: String
    let items: [Item]
}

struct DefaultFeedDataProvider: FeedDataProvider {
    func getFeeds() -> [Feed] {
        var items: [Feed.Item] = []
        for index in 1...20 {
            items.append(Feed.Item(title: "Item\(index)", color: UIColor.random))
        }
        return [Feed(title: "First Section", items: items)]
    }
}
