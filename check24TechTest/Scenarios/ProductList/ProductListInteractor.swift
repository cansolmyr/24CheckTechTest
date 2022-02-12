//
//  ProductListInteractor.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//  Copyright (c) 2022 Can TOKER. All rights reserved.
import UIKit

protocol IProductListInteractor: class {
	var parameters: [String: Any]? { get }
}

class ProductListInteractor: IProductListInteractor {
    var presenter: IProductListPresenter!
    var parameters: [String: Any]?

    private var manager: IProductListManager {
        return ProductListManager()
    }

    init(presenter: IProductListPresenter) {
    	self.presenter = presenter
    }
}
