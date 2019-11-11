//
//  MovesPresenterTests.swift
//  PokeDex
//
//  Created by Pedro Ramos on 11/11/19.
//  Copyright (c) 2019 Pedro Ramos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import PokeDex
import XCTest

class MovesPresenterTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: MovesPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupMovesPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupMovesPresenter() {
        sut = MovesPresenter()
    }
    
    // MARK: Test doubles
    
    class MovesDisplayLogicSpy: MovesDisplayLogic {
        var displaySomethingCalled = false
        
        func displaySomething(viewModel: Moves.Something.ViewModel) {
            displaySomethingCalled = true
        }
    }
    
    // MARK: Tests
    
    func testPresentSomething() {
        // Given
        let spy = MovesDisplayLogicSpy()
        sut.viewController = spy
        let response = Moves.Something.Response()
        
        // When
        sut.presentSomething(response: response)
        
        // Then
        XCTAssertTrue(spy.displaySomethingCalled, "presentSomething(response:) should ask the view controller to display the result")
    }
}
