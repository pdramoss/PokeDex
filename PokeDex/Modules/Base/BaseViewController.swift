//
//  BaseViewController.swift
//  PokeDex
//
//  Created by Pedro Ramos on 11/11/19.
//  Copyright © 2019 Pedro Ramos. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private let imageView: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setBackgroundImage(image: UIImage?) {
        if let first = view.subviews.first(where: { $0 === self.imageView.self }) as? UIImageView{
            first.image = image
            return
        }
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame = view.bounds
        imageView.image = image
        view.sendSubviewToBack(imageView)
    }
    
    func removeBackgroundImage() {
        imageView.removeFromSuperview()
    }
}
