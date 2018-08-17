import XCTest

extension NoteheadTests {
    static let __allTests = [
        ("testNotehead", testNotehead),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(NoteheadTests.__allTests),
    ]
}
#endif
