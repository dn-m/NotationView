import XCTest

import RhythmViewTests
import PlotViewTests
import StaffViewTests

var tests = [XCTestCaseEntry]()
tests += RhythmViewTests.__allTests()
tests += PlotViewTests.__allTests()
tests += StaffViewTests.__allTests()

XCTMain(tests)
