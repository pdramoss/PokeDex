//
//  HomeInteractorTests.swift
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

class HomeInteractorTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: HomeInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        sut = HomeInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    // MARK: Test doubles
    
    class HomePresentationLogicSpy: HomePresentationLogic {
        var presentAllPokemonsCalled = false
        var presentMessageErrorCalled = false
        
        func presentAllPokemons(response: HomeScene.Load.Response) {
            presentAllPokemonsCalled = true
        }
        
        func presentMessageError(error: Error) {
            presentMessageErrorCalled = true
        }
    }
    
    class HomeWorkerSpy: HomeWorkerProtocol {
        func fetchPokemons(offset: Int, limit: Int, completion: @escaping (Result<[BasicAPIResponse], Error>) -> Void) {
            if limit == 900 && offset == 0 {
                completion(.success([]))
            } else {
                completion(.failure(NetworkResponseError.failed))
            }
        }
    }
    
    // MARK: Tests
    
    func testDoSomething() {
        // Given
        let spy = HomePresentationLogicSpy()
        let worker = HomeWorkerSpy()
        sut.presenter = spy
        sut.worker = worker
        let request = HomeScene.Load.Request(offset: 0, limit: 900)
        
        // When
        sut.doLoadInitialData(request: request)
        
        // Then
        XCTAssertTrue(spy.presentAllPokemonsCalled)
    }
}