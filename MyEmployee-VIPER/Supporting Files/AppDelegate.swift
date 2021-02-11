//
//  AppDelegate.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        setRoot()

        return true
    }

    private func setRoot() {
        window = UIWindow()
        let empListVC = MoviesModuleBuilder().buildModule()
        let navigationController = UINavigationController(rootViewController: empListVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

