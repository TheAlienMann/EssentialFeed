import Foundation
import XCTest
import EssentialFeed

class FeedLocalizationTests: XCTestCase {
  func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
    let table = "Feed"
//    let bundle = Bundle(for: FeedPresenter.self)
    let bundle = Bundle.module
    
    assertLocalizedKeyAndValuesExist(in: bundle, table)
  }
}
