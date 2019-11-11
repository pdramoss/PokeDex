//
//  HomeViewControllerTests.swift
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

class HomeViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: HomeViewController!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        sut = HomeViewController()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test doubles
    
    class HomeBusinessLogicSpy: HomeBusinessLogic {
        var doLoadInitialDataCalled = false
        func doLoadInitialData(request: HomeScene.Load.Request) {
            doLoadInitialDataCalled = true
        }
    }
    
    // MARK: Tests
    
    func testShouldDoSomethingWhenViewIsLoaded() {
        // Given
        let spy = HomeBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        sut.loadInitialData()
        
        // Then
        XCTAssertTrue(spy.doLoadInitialDataCalled, "viewDidLoad() should ask the interactor to do something")
    }
    
//    func testDisplaySomething() {
//        // Given
//        let viewModel = HomeScene.Something.ViewModel()
//
//        // When
//        loadView()
//        sut.displaySomething(viewModel: viewModel)
//
//        // Then
//        //XCTAssertEqual(sut.nameTextField.text, "", "displaySomething(viewModel:) should update the name text field")
//    }
}