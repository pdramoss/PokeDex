//
//  PokemonsRouter.swift
//  PokeDex
//
//  Created by Pedro Ramos on 11/11/19.
//  Copyright (c) 2019 Pedro Ramos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol PokemonsRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol PokemonsDataPassing {
    var dataStore: PokemonsDataStore? { get }
}

class PokemonsRouter: NSObject, PokemonsRoutingLogic, PokemonsDataPassing {
    weak var viewController: PokemonsViewController?
    var dataStore: PokemonsDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?) {
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: PokemonsViewController, destination: SomewhereViewController) {
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: PokemonsDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
