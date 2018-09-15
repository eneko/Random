import XCTest

import randomTests

var tests = [XCTestCaseEntry]()
tests += randomTests.allTests()
XCTMain(tests)