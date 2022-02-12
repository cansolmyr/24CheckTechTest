//
//  ProductDetailInteractor.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//  Copyright (c) 2022 Can TOKER. All rights reserved.
import UIKit

protocol IProductDetailInteractor: class {
	var parameters: [String: Any]? { get }
}

class ProductDetailInteractor: IProductDetailInteractor {
    var presenter: IProductDetailPresenter!
    var parameters: [String: Any]?

    private var manager: IProductDetailManager {
        return ProductDetailManager()
    }

    init(presenter: IProductDetailPresenter) {
    	self.presenter = presenter
    }
}
