import UIKit
import XCTest
import DuckDate

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEndOfWeek() {
        // Current date
        let date = NSDate()
        // End of week
        let endOfWeek = date.endOfWeek
        // Start of week + 1 day + 6 days
        let sameEndOfWeek = date.startOfWeek.plusOneDay.plusDays(6)
        
        // It should be the same date
        XCTAssertTrue(endOfWeek==sameEndOfWeek, "End of the week should be the same")
    }
}