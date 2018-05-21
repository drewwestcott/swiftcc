//: Hacking With Swift Swift Coding Challenge
//: Do two strings contain the same characters?

import Foundation
import XCTest

print("This is a test")

class sameCharacters {
    
    func challenge3(input1: String, input2: String) -> Bool {

        // My first attempt at the challenge
        //
        //let arrayOfString1 = input1.characters.sorted()
        //let arrayOfString2 = input2.characters.sorted()
        //
        // However, .characters has been depreciated, so
        
        // Upon reading Paul's hints
        let arrayOfString1 = Array(input1).sorted()
        let arrayOfString2 = Array(input2).sorted()
        
        return arrayOfString1 == arrayOfString2
    }

}


// Mark: Unit Tests

class testChallenge3: XCTestCase {
    
    let sut = sameCharacters()
    
    override func setUp() {
        super.setUp()
    }
    
    func test_stringsContainsSameCharacters() {
        
        XCTAssert( sut.challenge3(input1: "abca", input2: "abca") == true , "abca should return true")
        XCTAssert( sut.challenge3(input1: "abc", input2: "cba") == true , "abc should return true")
        XCTAssert( sut.challenge3(input1: "a1 b2", input2: "b1 a2") == true , "a1 b2 has the same characters")
        XCTAssert( sut.challenge3(input1: "abc", input2: "abca") == false, "abca, does not have the same characters")
        XCTAssert( sut.challenge3(input1: "abc", input2: "Abc") == false, "Abc, does not have the same characters")
        XCTAssert( sut.challenge3(input1: "abc", input2: "cbAa") == false, "cbAa, does not have the same characters")
    }
}

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}

let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
testChallenge3.defaultTestSuite.run()
