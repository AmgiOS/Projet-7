//
//  Zozor_Tests.swift
//  CountOnMeTests
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class Zozor_Tests: XCTestCase {
    var operations: Operations!
    
    override func setUp() {
        super.setUp()
        operations = Operations()
    }
    
    func testGivenArrayStringIsEmpty_WhenCheckIfString_ThenCanAddOperator() {
        operations.stringNumbers = [""]
        
        XCTAssertFalse(operations.canAddOperator)
    }
    
    func testGivenArrayStringIsEmpty_WhenCheckBoolExpression_ThenAddString() {
        operations.addNewNumber(1)
        
        XCTAssertTrue(operations.isExpressionCorrect)
    }
    
    func testGiven() {
        
    }
    
    func testGivenAddNumber_WhenCalculateDiviserFor0_ThenResultTotal() {
        operations.addNewNumber(3)
        
        _ = operations.diviser()
        
        operations.addNewNumber(0)
        
        XCTAssertTrue(operations.calculateTotal() == "0")
    }
    
    func testIsExpressionCorrect_WhenExpressionTappedIsNotCorrect_ThenExpressionReturnFalse() {
        operations.addNewNumber(1)
        
        _ = operations.plus()
        
        _ = operations.calculateTotal()
        
        XCTAssertFalse(operations.isExpressionCorrect)
    }
    
    func testIsExpressionCorrect_WhenStringNumberContainNothing_ThenExpressionReturnFalse() {
        _ = operations.plus()
        
        XCTAssertFalse(operations.isExpressionCorrect)
    }
    
    func testGivenAddNumber_WhenAddOperatorPlus_ThenCalculateTotal() {
        operations.addNewNumber(1)
        
        _ = operations.plus()
        
        operations.addNewNumber(2)
        
        XCTAssert(operations.calculateTotal() == "3")
    }
    
    func testGivenAddNumber_WhenAddOperatorMultiply_ThenCalculateTotal() {
        operations.addNewNumber(5)
        
        _ = operations.multiply()
        
        operations.addNewNumber(3)
        
        XCTAssert(operations.calculateTotal() == "15")
    }
    
    func testGivenAddNumber_WhenAddOperatorDiviser_ThenCalculateTotal() {
        operations.addNewNumber(10)
        
        _ = operations.diviser()
        
        operations.addNewNumber(5)
        
        XCTAssert(operations.calculateTotal() == "2")
    }
    
    func testGivenAddNumber_WhenAddOperatorMinus_ThenCalculateTotal() {
        operations.addNewNumber(15)
        
        _ = operations.minus()
        
        operations.addNewNumber(5)
        
        XCTAssert(operations.calculateTotal() == "10")
    }
}
