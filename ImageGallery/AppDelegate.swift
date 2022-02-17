//
//  AppDelegate.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let navVC = UINavigationController(rootViewController: GalleryViewController())
        
        window?.rootViewController = navVC
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        DatabaseService.saveContext()
    }
}

