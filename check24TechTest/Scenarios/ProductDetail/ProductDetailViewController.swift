//
//  ProductDetailViewController.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//  Copyright (c) 2022 Can TOKER. All rights reserved.

import UIKit

protocol IProductDetailViewController: class {
	// do someting...
}

class ProductDetailViewController: UIViewController {
    var presenter: IProductDetailPresenter!
	var router: IProductDetailRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ProductDetailViewController: IProductDetailViewController {
	// do someting...
}

extension ProductDetailViewController {
	// do someting...
}

extension ProductDetailViewController {
	// do someting...
}
