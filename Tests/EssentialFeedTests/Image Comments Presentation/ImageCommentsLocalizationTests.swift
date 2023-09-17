import Foundation
import XCTest
import EssentialFeed

class ImageCommentsLocalizationTests: XCTestCase {
  func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
    let table = "ImageComments"
//    let bundle = Bundle(for: ImageCommentsPresenter.self)
    let bundle = Bundle.module
    
    assertLocalizedKeyAndValuesExist(in: bundle, table)
  }
}
