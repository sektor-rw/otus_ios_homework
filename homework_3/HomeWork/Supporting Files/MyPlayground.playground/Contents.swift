import UIKit
import Foundation

protocol FeedDataProvider {
    func getFeeds() -> [Feed]
}

struct Feed {
    let title: String
}

struct DefaultFeedDataProvider: FeedDataProvider {
    func getFeeds() -> [Feed] {
        var result: [Feed] = []
        for index in 1...20 {
            result.append(Feed(title: "Item\(index)"))
        }
        return result
    }
}

let newDataProvider = DefaultFeedDataProvider().getFeeds()
