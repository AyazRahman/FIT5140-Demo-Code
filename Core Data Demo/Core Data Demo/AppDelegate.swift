//
//  AppDelegate.swift
//  Core Data Demo
//
//  Created by Ayaz Rahman on 26/8/20.
//  Copyright © 2020 Ayaz Rahman. All rights reserved.
//

import UIKit
import CoreData

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
    
    /*
     Set a container that can be used through out the application.
     We used lazy so that initializing this variable would not affect the application load time.
     It will only be initialized when we try to access this variable for the first time.
     */
    lazy var persistentContainer: NSPersistentContainer = {
        
        let persistentContainer = NSPersistentContainer(name: "Model")
        
        persistentContainer.loadPersistentStores(){(description, error) in
            if let error = error as NSError? {
                fatalError("Error in Core Data Stack: \(error), \(error.userInfo)")
            }
        }
        
        return persistentContainer
    }()


}

