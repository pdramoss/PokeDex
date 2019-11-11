//
//  PokemonsInteractorTests.swift
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

class PokemonsInteractorTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: PokemonsInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupPokemonsInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupPokemonsInteractor() {
        sut = PokemonsInteractor()
    }
    
    // MARK: Test doubles
    
    class PokemonsPresentationLogicSpy: PokemonsPresentationLogic {
        var presentSomethingCalled = false
        
        func presentSomething(response: Pokemons.Something.Response) {
            presentSomethingCalled = true
        }
    }
    
    // MARK: Tests
    
    func testDoSomething() {
        // Given
        let spy = PokemonsPresentationLogicSpy()
        sut.presenter = spy
        let request = Pokemons.Something.Request()
        
        // When
        sut.doSomething(request: request)
        
        // Then
        XCTAssertTrue(spy.presentSomethingCalled, "doSomething(request:) should ask the presenter to format the result")
    }
}