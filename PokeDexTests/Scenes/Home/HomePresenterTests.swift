//
//  HomePresenterTests.swift
//  PokeDex
//
//  Created by Pedro Ramos on 22/10/19.
//  Copyright (c) 2019 Pedro Ramos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import PokeDex
import XCTest

class HomePresenterTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: HomePresenter!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        sut = HomePresenter()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    // MARK: Test doubles
    
    class HomeDisplayLogicSpy: HomeDisplayLogic {
        
        var pokemons: [SimplePokemonResponse] = []
        var displayInitialDataCalled = false
        var displayMessageErrorCalled = false
        
        func displayInitialData(viewModel: HomeScene.Load.ViewModel) {
            self.pokemons = viewModel.pokemons
            displayInitialDataCalled = true
        }
        
        func displayMessageError(error: Error) {
            displayMessageErrorCalled = true
        }
    }
    
    // MARK: Tests
    
    func testPresentSomething() {
        // Given
        let spy = HomeDisplayLogicSpy()
        sut.viewController = spy
        let response = HomeScene.Load.Response(pokemons: [])
        
        // When
        sut.presentAllPokemons(response: response)
        
        // Then
        XCTAssertTrue(spy.displayInitialDataCalled, "presentSomething(response:) should ask the view controller to display the result")
    }
}
