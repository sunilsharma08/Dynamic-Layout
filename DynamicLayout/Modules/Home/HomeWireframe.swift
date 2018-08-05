//
//  HomeWireframe.swift
//  DynamicLayout
//
//  Created by Sunil on 04/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import UIKit

class HomeWireframe:BaseWireframe {

    private let storyboard = UIStoryboard(name: "Home", bundle: nil)
    
    init() {
        let viewController = storyboard.instantiateViewController(ofType: HomeViewController.self)
        super.init(viewController: viewController)
        
        let interactor = HomeInteractor()
        let presenter = HomePresenter(wireframe: self, view: viewController, interactor: interactor)
        viewController.presenter = presenter
        
    }
    
}

extension HomeWireframe: HomeWireframeInterface {
    
}
























