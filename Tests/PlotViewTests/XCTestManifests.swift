import XCTest

extension DefaultVerticalPlotModelTests {
    static let __allTests = [
        ("testBuilder", testBuilder),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DefaultVerticalPlotModelTests.__allTests),
    ]
}
#endif
