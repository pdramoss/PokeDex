//
//  HomeRouter.swift
//  PokeDex
//
//  Created by Pedro Ramos on 22/10/19.
//  Copyright (c) 2019 Pedro Ramos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol HomeRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
}
