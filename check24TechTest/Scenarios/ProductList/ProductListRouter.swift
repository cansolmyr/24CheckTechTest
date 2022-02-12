//
//  ProductListRouter.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//  Copyright (c) 2022 Can TOKER. All rights reserved.

import UIKit

protocol IProductListRouter {
	// do someting...
}

class ProductListRouter: IProductListRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> ProductListViewController {
        let bundle = Bundle(for: type(of: self))
        let view = ProductListViewController(nibName: "ProductListViewController", bundle: bundle)
        let presenter = ProductListPresenter(view: view)
        let interactor = ProductListInteractor(presenter: presenter)
        view.presenter = presenter
        presenter.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
