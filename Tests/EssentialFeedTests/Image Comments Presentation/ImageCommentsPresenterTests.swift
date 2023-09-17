import Foundation
import XCTest
import EssentialFeed

class ImageCommentsPresenterTests: XCTestCase {
  
  func test_title_isLocalized() {
    XCTAssertEqual(ImageCommentsPresenter.title, localized("IMAGE_COMMENTS_VIEW_TITLE"))
  }
  
  func test_map_createsViewModels() {
    let now = Date()
    let calendar = Calendar(identifier: .gregorian)
    let locale = Locale(identifier: "en_US_POSIX")
    
    let comments = [
      ImageComment(id: UUID(),
                   message: "a message",
                   createdAt: now.adding(minutes: -5, calendar: calendar),
                   username: "a username"),
      ImageComment(id: UUID(),
                   message: "another message",
                   createdAt: now.adding(days: -1, calendar: calendar),
                   username: "another username"),
    ]
    
    let viewModel = ImageCommentsPresenter.map(
      comments,
      currentDate: now,
      calendar: calendar,
      locale: locale
    )
    
    XCTAssertEqual(viewModel.comments,
                   [
                    ImageCommentViewModel(message: "a message",
                                          date: "5 minutes ago",
                                          username: "a username"),
                    ImageCommentViewModel(message: "another message",
                                          date: "1 day ago",
                                          username: "another username"),
                   ])
  }
  
  // MARK: - Helpers
  
  private func localized(_ key: String, file: StaticString = #filePath, line: UInt = #line) -> String {
    let table = "ImageComments"
//    let bundle = Bundle(for: ImageCommentsPresenter.self)
    let bundle = Bundle.module
    let value = bundle.localizedString(forKey: key, value: nil, table: table)
    if value == key {
      XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
    }
    return value
  }
}

/*
import class Foundation.Bundle
import class Foundation.ProcessInfo
import struct Foundation.URL

private class BundleFinder {}

extension Foundation.Bundle {
    /// Returns the resource bundle associated with the current Swift module.
    static let module: Bundle = {
        let bundleName = "EssentialFeed_EssentialFeedTests"

        let overrides: [URL]
        #if DEBUG
        if let override = ProcessInfo.processInfo.environment["PACKAGE_RESOURCE_BUNDLE_URL"] {
            overrides = [URL(fileURLWithPath: override)]
        } else {
            overrides = []
        }
        #else
        overrides = []
        #endif

        let candidates = overrides + [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: BundleFinder.self).resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named EssentialFeed_EssentialFeedTests")
    }()
}
*/
