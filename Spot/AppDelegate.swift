//
//  AppDelegate.swift
//  saurabh
//
//  Created by Saurabhnegi on 19/05/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var rootViewController = ViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

 
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
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        let parameters = rootViewController.appRemote.authorizationParameters(from: url);
//
//                if let access_token = parameters?[SPTAppRemoteAccessTokenKey] {
//                    rootViewController.appRemote.connectionParameters.accessToken = access_token
//                    rootViewController.accessToken = access_token
//                } else if let error_description = parameters?[SPTAppRemoteErrorDescriptionKey] {
//                    // Show the error
//                }
      return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
      if rootViewController.appRemote.isConnected {
     rootViewController.appRemote.disconnect()
      }
        func applicationDidBecomeActive(_ application: UIApplication) {
          if let _ = rootViewController.appRemote.connectionParameters.accessToken {
            rootViewController.appRemote.connect()
          }

}

    }
}

