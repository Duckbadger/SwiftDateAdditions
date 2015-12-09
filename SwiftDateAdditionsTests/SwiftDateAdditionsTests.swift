//
//  SwiftDateAdditionsTests.swift
//  SwiftDateAdditionsTests
//
//  Created by Ken on 06/12/2015.
//  Copyright © 2015 Ken Boucher. All rights reserved.
//

import XCTest
@testable import SwiftDateAdditions

class SwiftDateAdditionsTests: XCTestCase {
  
  static let dateFormatter: NSDateFormatter = {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "dd MM yyyy HH:mm"
    return formatter
  }()
  
  typealias DatePair = (left: NSDate, right: NSDate)
  
  static func dates(lhs: String, rhs: String) -> DatePair {
    let leftDate = dateFormatter.dateFromString(lhs)
    let rightDate = dateFormatter.dateFromString(rhs)
    return DatePair(leftDate!, rightDate!)
  }
  
  static let dateFebruary = "01 02 2015 10:00"
  static let dateMarch = "01 03 2015 10:00"
  static let dateMay = "16 05 2015 10:00"
  
  var datesAscending: DatePair = {
    return SwiftDateAdditionsTests.dates(SwiftDateAdditionsTests.dateFebruary, rhs: SwiftDateAdditionsTests.dateMarch)
  }()
  
  var datesEqual: DatePair = {
    return SwiftDateAdditionsTests.dates(SwiftDateAdditionsTests.dateMay, rhs: SwiftDateAdditionsTests.dateMay)
  }()
  
  var datesDescending: DatePair = {
   return SwiftDateAdditionsTests.dates(SwiftDateAdditionsTests.dateMarch, rhs: SwiftDateAdditionsTests.dateFebruary)
  }()
  
  // <
  func testLessThan() {
    XCTAssert((datesAscending.left < datesAscending.right) == true)
    XCTAssert((datesEqual.left < datesEqual.right) == false)
    XCTAssert((datesDescending.left < datesDescending.right) == false)
  }
  
  // <=
  func testLessThanEqualTo() {
    XCTAssert((datesAscending.left <= datesAscending.right) == true)
    XCTAssert((datesEqual.left <= datesEqual.right) == true)
    XCTAssert((datesDescending.left <= datesDescending.right) == false)
  }
  
  // ==
  func testEqualTo() {
    XCTAssert((datesAscending.left == datesAscending.right) == false)
    XCTAssert((datesEqual.left == datesEqual.right) == true)
    XCTAssert((datesDescending.left == datesDescending.right) == false)
  }
  
  // >=
  func testGreaterThanEqualTo() {
    XCTAssert((datesAscending.left >= datesAscending.right) == false)
    XCTAssert((datesEqual.left >= datesEqual.right) == true)
    XCTAssert((datesDescending.left >= datesDescending.right) == true)
  }
  
  // >
  func testGreaterThan() {
    XCTAssert((datesAscending.left > datesAscending.right) == false)
    XCTAssert((datesEqual.left > datesEqual.right) == false)
    XCTAssert((datesDescending.left > datesDescending.right) == true)
  }
}
