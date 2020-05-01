//
//  applySpecTests.swift
//  Ramda_Tests
//
//  Created by Christian Leovido on 01/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import Ramda

class ApplySpecTests: XCTestCase {

    func testApplySpec() throws {
        let add1 = R.add(1)
        let spec = R.applySpec(["sum": add1])

        XCTAssertEqual(spec(1), ["sum": 2])

    }

    func testApplySpec2() throws {
        let add1 = R.add(1)
        let add20 = R.add(20)
        let spec = R.applySpec(["sum": add1, "add20": add20])

        XCTAssertEqual(spec(3), ["sum": 4, "add20": 23])

    }

    func testApplySpec3() throws {
        let loud = R.toUpper
        let quiet = R.toLower
        let spec = R.applySpec(["loud": loud, "quiet": quiet])

        XCTAssertEqual(spec("rAmDa"), ["loud": "RAMDA", "quiet": "ramda"])

    }

    func testApplySpecCurried() throws {

        typealias IntSpec = ([String: (Int) -> Int]) -> (Int) -> [String: Int]

        let double: (Int) -> Int = { value in value * value }
        let triple: (Int) -> Int = { value in value * value * value }

        let partialSpec: IntSpec = R.applySpec()
        let spec = partialSpec(["doubled": double, "tripled": triple])

        XCTAssertEqual(spec(20), ["doubled": 400, "tripled": 8000])
    }

}
