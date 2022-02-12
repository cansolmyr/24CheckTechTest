//
//  AppDelegate.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
    func organizeModules () {
        AppRouter.share.modules =
        [
            Modules.productList.routePath:      {ProductListModule($0)},
            Modules.productDetail.routePath:    {ProductDetailModule($0)}
        ]
        AppRouter.share.presentModule(module: Modules.productList, type: .root)
        O
    }

}

