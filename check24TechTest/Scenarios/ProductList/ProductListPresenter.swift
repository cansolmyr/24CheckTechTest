//
//  ProductListPresenter.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//  Copyright (c) 2022 Can TOKER. All rights reserved.
import UIKit

protocol IProductListPresenter: class {
	// do someting...
}

class ProductListPresenter: IProductListPresenter {	
	weak var view: IProductListViewController!
    var interactor: IProductListInteractor!
	
	init(view: IProductListViewController) {
		self.view = view
	}
}
