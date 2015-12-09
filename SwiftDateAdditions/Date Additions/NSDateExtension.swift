//
//  NSDateExtension.swift
//  SwiftDateAdditions
//
//  Created by Ken on 07/12/2015.
//  Copyright © 2015 Ken Boucher. All rights reserved.
//

import Foundation

public func < (lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.compare(rhs) == .OrderedAscending
}

public func == (lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.isEqualToDate(rhs)
}

extension NSDate: Comparable {}