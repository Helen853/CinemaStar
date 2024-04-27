// FilmDetailUITests.swift
// Copyright © RoadMap. All rights reserved.

import XCTest

// swiftlint: disable all
final class FilmDetailUITests: XCTestCase {
    let app = XCUIApplication()
    let expectation = XCTestExpectation()

    override func setUp() {
        app.launch()
        let element = app.collectionViews.children(matching: .cell)
            .element(boundBy: 1).children(matching: .other).element
        element.tap()
        continueAfterFailure = false
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    /// Проверка кнопки "назад"
    func testBackButton() {
        let cinemastarFilmdetailsviewNavigationBar = app.navigationBars["CinemaStar.FilmDetailsView"]
        let backButton = cinemastarFilmdetailsviewNavigationBar.buttons["back"]
        backButton.tap()
    }

    /// Проверка кнопки избранное
    func testFavoritesButton() {
        let cinemastarFilmdetailsviewNavigationBar = app.navigationBars["CinemaStar.FilmDetailsView"]
        let favoritesButton = cinemastarFilmdetailsviewNavigationBar.buttons["favorites"]
        favoritesButton.tap()
    }

    /// Проверка название в таблице
    func testTitle() {
        let tablesQuery = app.tables
        let seeTitle = tablesQuery.staticTexts["Смотреть"]
        let actorTitle = tablesQuery.staticTexts["Актеры и съемочная группа"]
        let languageTitle = tablesQuery.staticTexts["Язык"]
        let recomendationTitle = tablesQuery.staticTexts["Смотрите также"]

        XCTAssertTrue(seeTitle.exists)
        XCTAssertTrue(actorTitle.exists)
        XCTAssertTrue(languageTitle.exists)
        XCTAssertTrue(recomendationTitle.exists)
    }

    /// Проверка нажатия кнопки "смотреть"
    func testButtonSee() {
        let tablesQuery = app.tables
        let buttonSee = tablesQuery.staticTexts["Смотреть"]
        buttonSee.tap()
        app.alerts["Упс!"].scrollViews.otherElements.buttons["OK"].tap()
    }

    /// Проверка нажатия кнопки разворачивания текста
    func testMoreButton() {
        let tablesQuery = app.tables
        tablesQuery.buttons["more"].tap()
        tablesQuery.buttons["up"].tap()
    }
}

// swiftlint: enable all
