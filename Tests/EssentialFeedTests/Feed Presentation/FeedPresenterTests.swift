import Foundation
import XCTest
import EssentialFeed

class FeedPresenterTests: XCTestCase {
  func test_title_isLocalized() {
    XCTAssertEqual(FeedPresenter.title, localized("FEED_VIEW_TITLE"))
  }
  
  // MARK: - Helpers
  
  private func localized(_ key: String, file: StaticString = #file, line: UInt = #line) -> String {
    let table = "Feed"
//    let bundle = Bundle(for: FeedPresenter.self)
    let bundle = Bundle.module
    let value = bundle.localizedString(forKey: key, value: nil, table: table)
//    let value = NSLocalizedString(key, tableName: table, bundle: Bundle.module, value: "", comment: "a-comment")
    if value == key {
      XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
    }
    return value
  }
}
