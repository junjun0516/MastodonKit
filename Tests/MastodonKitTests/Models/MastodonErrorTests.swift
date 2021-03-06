import XCTest
@testable import MastodonKit

class MastodonErrorTests: XCTestCase {
    func testErrorWithValidJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/RequestError.json")
        let requestError = MastodonError(json: fixture)

        XCTAssertEqual(requestError.description, "yes, it's an error.")
    }

    func testErrorWithInvalidDictionary() {
        let requestError = MastodonError(json: [:])

        XCTAssertEqual(requestError.description, "")
    }

    func testErrorWithInvalidarray() {
        let requestError = MastodonError(json: [])

        XCTAssertEqual(requestError.description, "")
    }
}
