//
//  AppDelegate.swift
//  arsenalytics
//
//  Created by Kacper Jagiello on 24/12/2019.
//  Copyright © 2019 jagiello.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
      
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
//    
//    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
//        if topViewController(in: window?.rootViewController) is CanRotate {
//            return .portrait
//        } else {
//            return .portrait
//        }
//    }
//
//
//    func topViewController(in rootViewController: UIViewController?) -> UIViewController? {
//        guard let rootViewController = rootViewController else {
//            return nil
//        }
//
//        if let tabBarController = rootViewController as? UITabBarController {
//            return topViewController(in: tabBarController.selectedViewController)
//        } else if let navigationController = rootViewController as? UINavigationController {
//            return topViewController(in: navigationController.visibleViewController)
//        } else if let presentedViewController = rootViewController.presentedViewController {
//            return topViewController(in: presentedViewController)
//        }
//        return rootViewController
//    }
}

