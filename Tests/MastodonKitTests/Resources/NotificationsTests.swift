import XCTest
@testable import MastodonKit

class NotificationsTests: XCTestCase {
    func testAll() {
        let resource = Notifications.all()

        XCTAssertEqual(resource.path, "/api/v1/notifications")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<[MastodonKit.Notification]?>.self)
    }

    func testNotification() {
        let resource = Notifications.notification(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/notifications/42")
        XCTAssertEqual(resource.httpMethod, .get)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<MastodonKit.Notification?>.self)
    }

    func testDismissAll() {
        let resource = Notifications.dismissAll()

        XCTAssertEqual(resource.path, "/api/v1/notifications/clear")
        XCTAssertEqual(resource.httpMethod, .post)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<MastodonKit.Notification?>.self)
    }

    func testDismissWithID() {
        let resource = Notifications.dismiss(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/notifications/dismiss/42")
        XCTAssertEqual(resource.httpMethod, .post)
        XCTAssertNil(resource.parameters)

        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<MastodonKit.Notification?>.self)
    }
}
