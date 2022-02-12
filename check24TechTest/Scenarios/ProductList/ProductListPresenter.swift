//
//  ProductListPresenter.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//  Copyright (c) 2022 Can TOKER. All rights reserved.
import UIKit

protocol IProductListPresenter: class {
	func viewDidLoad()
    func successRequest(data: ProductListModel.Response)
    func failureRequest(message: String)
}

class ProductListPresenter: IProductListPresenter {
    func successRequest(data: ProductListModel.Response) {
        
    }
    
    func failureRequest(message: String) {
        
    }
    
	weak var view: IProductListViewController!
    var interactor: IProductListInteractor!
	
	init(view: IProductListViewController) {
		self.view = view
	}
    func viewDidLoad() {
        interactor.getProductList()
    }
}
