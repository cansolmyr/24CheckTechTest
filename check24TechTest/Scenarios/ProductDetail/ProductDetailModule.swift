//
//  ProductDetailModule.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//  Copyright (c) 2022 Can TOKER. All rights reserved.

import UIKit

class ProductDetailModule: IModule {
    let appRouter: IAppRouter
    private var router: ProductDetailRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = ProductDetailRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}
