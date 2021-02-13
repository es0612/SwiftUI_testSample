//
//  SwiftUITestSampleUITests.swift
//  SwiftUITestSampleUITests
//
//  Created by harami on 2021/02/14.
//

import XCTest

class SwiftUITestSampleUITests: XCTestCase {

    private var app: XCUIApplication?

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app!.launch()

    }

    override func tearDownWithError() throws {
    }

    //    Happy path test
    func testCalc() throws {

        let resultButton = app!.buttons["resultButton"]
        XCTAssertFalse(resultButton.isEnabled)


        let leftTextField = app!.textFields["leftTextField"]
        leftTextField.tap()
        leftTextField.typeText("1")
        leftTextField.typeText("2")
        XCTAssertFalse(resultButton.isEnabled)


        let rightTextField = app!.textFields["rightTextField"]
        rightTextField.tap()
        rightTextField.typeText("4")
        XCTAssertTrue(resultButton.isEnabled)


        sleep(1)

        resultButton.tap()
        let resultLabel = app!.staticTexts["resultLabel"]
        XCTAssertEqual(resultLabel.label, "48.0")
    }

}
