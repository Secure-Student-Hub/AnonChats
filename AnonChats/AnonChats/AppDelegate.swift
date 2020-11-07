//
//  AppDelegate.swift
//  AnonChats
//
//  Created by Subomi Popoola on 11/7/20.
//

import UIKit
import Parse
import IQKeyboardManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let parseConfig = ParseClientConfiguration {
              $0.applicationId = "PIKOKHaYHjCpVxdgSMBRiqq9DtWw2qax2ZZdWOey"
              $0.clientKey = "2876O6soOq3y5shPNKC9Y5iDuNyjWUzqqq7D1Nqu"
              $0.server = "https://parseapi.back4app.com"
          }
        Parse.initialize(with: parseConfig)
        
        IQKeyboardManager.shared().isEnabled = true
        
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


}

