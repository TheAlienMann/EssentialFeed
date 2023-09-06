import Foundation
import XCTest
import EssentialFeed

class SharedLocalizationTests: XCTestCase {
  func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
    let table = "Shared"
//    let bundle = Bundle(for: LoadResourcePresenter<Any, DummyView>.self)
    let bundle = Bundle.module
    
    assertLocalizedKeyAndValuesExist(in: bundle, table)
  }
  
  private class DummyView: ResourceView {
    func display(_ viewModel: Any) { }
  }
}
