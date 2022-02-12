//
//  ProductDetailPresenter.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//  Copyright (c) 2022 Can TOKER. All rights reserved.
import UIKit

protocol IProductDetailPresenter: class {
	// do someting...
}

class ProductDetailPresenter: IProductDetailPresenter {	
	weak var view: IProductDetailViewController!
    var interactor: IProductDetailInteractor!
	
	init(view: IProductDetailViewController) {
		self.view = view
	}
}
