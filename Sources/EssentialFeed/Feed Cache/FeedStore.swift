import Foundation

public typealias CachedFeed = (feed: [LocalFeedImage], timestamp: Date)

public protocol FeedStore {
    func deleteCachedFeed() throws
    func insert(_ feed: [LocalImageFeed], timestamp: Date) throws
    func retrieve() throws -> CachedFeed?
}
