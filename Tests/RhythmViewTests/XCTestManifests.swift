import XCTest

extension BeamsViewTests {
    static let __allTests = [
        ("testBeamAngledDown", testBeamAngledDown),
        ("testBeamAngledUp", testBeamAngledUp),
        ("testBeamsAndBeamletsWithBeaming", testBeamsAndBeamletsWithBeaming),
        ("testBeamsAndBeamletsWithBeaming2", testBeamsAndBeamletsWithBeaming2),
        ("testBeamsAngledDown", testBeamsAngledDown),
        ("testBeamsAngledDownWithBeaming", testBeamsAngledDownWithBeaming),
        ("testBeamsAngledUp", testBeamsAngledUp),
        ("testBeamsAngledUpWithBeaming", testBeamsAngledUpWithBeaming),
        ("testBeamsStraight", testBeamsStraight),
        ("testBeamsStraightWithBeaming", testBeamsStraightWithBeaming),
        ("testBeamStraight", testBeamStraight),
        ("testBeamStraightWithBeaming", testBeamStraightWithBeaming),
        ("testBeamsWithRhythm", testBeamsWithRhythm),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BeamsViewTests.__allTests),
    ]
}
#endif
