//
//  AppDelegate.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 17/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let repository = RepositoriesRepository(with: CoreDataWorker<RepositoryManagedObject, Repository>())
        let viewModel = RepositoryViewModel(with: repository)
        let controller = RepositoryViewController(nibName: RepositoryViewController.nibName, bundle: nil)
        controller.viewModel = viewModel

        let navigation = UINavigationController(rootViewController: controller)

        window?.rootViewController = navigation
        window?.makeKeyAndVisible()

        return true
    }
}
