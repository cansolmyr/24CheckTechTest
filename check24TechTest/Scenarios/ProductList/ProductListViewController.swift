//
//  ProductListViewController.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//  Copyright (c) 2022 Can TOKER. All rights reserved.

import UIKit

protocol IProductListViewController: class {
	// do someting...
}

class ProductListViewController: UIViewController {
    var presenter: IProductListPresenter!
	var router: IProductListRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ProductListViewController: IProductListViewController {
	// do someting...
}

extension ProductListViewController {
	// do someting...
}

extension ProductListViewController {
	// do someting...
}
