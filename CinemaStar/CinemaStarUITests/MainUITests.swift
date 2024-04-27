// MainUITests.swift
// Copyright © RoadMap. All rights reserved.

import XCTest

// swiftlint: disable all
final class MainUITests: XCTestCase {
    let app = XCUIApplication()
    let expectation = XCTestExpectation()

    override func setUp() {
        app.launch()
        continueAfterFailure = false
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    /// Проверка названия экрана
    func testTitle() throws {
        let title = app.staticTexts["Смотри исторические фильмы на CINEMA STAR"]
        XCTAssertTrue(title.exists)
    }

    /// Проверка скролла
    func testScrollCollection() {
        let horizontalScrollBar1PageCollectionView = app.collectionViews.containing(
            .other,
            identifier: "Horizontal scroll bar, 1 page"
        ).element
        horizontalScrollBar1PageCollectionView.swipeUp()
        horizontalScrollBar1PageCollectionView.swipeDown()
    }

    /// Проверка тапа по ячейке
    func testTapCell() {
        app.collectionViews.cells.otherElements.containing(.staticText, identifier: "Орда \n ⭐️ 6.0")
            .children(matching: .image).element.tap()
    }

    /// Проверка кол-ва отображаемых ячеек
    func testCountCells() throws {
        let collection = app.descendants(matching: .collectionView).firstMatch
        let countVisibleCells = 6
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: collection)
        waitForExpectations(timeout: 4)
        XCTAssertEqual(collection.cells.count, countVisibleCells)
    }
}

// swiftlint: enable all
