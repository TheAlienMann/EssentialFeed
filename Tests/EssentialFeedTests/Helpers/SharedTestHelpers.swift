import EssentialFeed
import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    Data("any data".utf8)
}

func makeItem(id: UUID, description: String? = nil, location: String? = nil, imageURL: URL) -> (model: FeedImage, json: [String: Any]) {
    let item = FeedImage(id: id, description: description, location: location, url: imageURL)

    let json = [
        "id": id.uuidString,
        "description": description,
        "location": location,
        "image": imageURL.absoluteString,
    ].compactMapValues { $0 }
    return (item, json)
}

func makeItemsJSON(_ items: [[String: Any]]) -> Data {
    let json = ["items": items]
    return try! JSONSerialization.data(withJSONObject: json)
}

func uniqueImage() -> FeedImage {
    FeedImage(id: UUID(), description: "any-description", location: "any-location", url: anyURL())
}

func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
    let models = [uniqueImage(), uniqueImage()]
    let local = models.map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
    return (models, local)
}

extension HTTPURLResponse {
    convenience init(statusCode: Int) {
        self.init(url: anyURL(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
    }
}

// MARK: -

extension Date {
    func adding(seconds: TimeInterval) -> Date {
        self + seconds
    }

    func adding(minutes: Int, calendar: Calendar = Calendar(identifier: .gregorian)) -> Date {
        calendar.date(byAdding: .minute, value: minutes, to: self)!
    }

    func adding(days: Int, calendar: Calendar = Calendar(identifier: .gregorian)) -> Date {
        calendar.date(byAdding: .day, value: days, to: self)!
    }
}

extension Date {
    func minusFeedCachedMaxAge() -> Date {
        adding(days: -feedCachedMaxAgeInDays)
    }

    private var feedCachedMaxAgeInDays: Int {
        7
    }
}
