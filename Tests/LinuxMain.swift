import XCTest

import PlotViewTests
import RhythmViewTests
import ScoreViewTests
import StaffViewTests

var tests = [XCTestCaseEntry]()
tests += PlotViewTests.__allTests()
tests += RhythmViewTests.__allTests()
tests += ScoreViewTests.__allTests()
tests += StaffViewTests.__allTests()

XCTMain(tests)
