//
//  ProductDetailRouter.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//  Copyright (c) 2022 Can TOKER. All rights reserved.

import UIKit

protocol IProductDetailRouter {
	// do someting...
}

class ProductDetailRouter: IProductDetailRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> ProductDetailViewController {
        let bundle = Bundle(for: type(of: self))
        let view = ProductDetailViewController(nibName: "ProductDetailViewController", bundle: bundle)
        let presenter = ProductDetailPresenter(view: view)
        let interactor = ProductDetailInteractor(presenter: presenter)
        view.presenter = presenter
        presenter.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
