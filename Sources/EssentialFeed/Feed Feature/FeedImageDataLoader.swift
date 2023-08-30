import Foundation

protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
