import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(GladiatorAssetManagerTests.allTests),
    ]
}
#endif
