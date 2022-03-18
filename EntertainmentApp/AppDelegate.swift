//
//  AppDelegate.swift
//  EntertainmentApp
//
//  Created by GSK on 3/9/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 13.0, *) {
            print("Moving to SceneDelegate, its over iOS 13 or Latest")
        } else {
            print("Moving to AppDelegate, its iOS 10 max~12")
            let bounds = UIScreen.main.bounds
            window = UIWindow(frame: bounds)
            
            let controllerHome = ViewController()
            let nav_ControllerHome = UINavigationController(rootViewController: controllerHome)
            nav_ControllerHome.navigationBar.barStyle = .black
            nav_ControllerHome.setNavigationBarHidden(true, animated: true)
            window?.rootViewController = nav_ControllerHome
            window?.makeKeyAndVisible()
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

