//
//  AppDelegate.swift
//  BINGDict
//
//  Created by YXLONG on 2017/5/19.
//  Copyright © 2017年 MST. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var tabController: UITabBarController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        tabController = UITabBarController()
        
        var vcs = [UIViewController]()
        let vc = BIHomePageViewController()
        
        vc.tabBarItem = UITabBarItem(title: "词典",
                                     image: UIImage(named: "ico_dictionary_1")?.withRenderingMode(.alwaysOriginal),
                                     selectedImage: UIImage(named: "ico_dictionary_2")?.withRenderingMode(.alwaysOriginal))
        vcs.append(vc)
        
//        let vc1 = UIViewController()
//        vc1.tabBarItem = UITabBarItem(title: "翻译",
//                                      image: UIImage(named: "ico_translate_1")?.withRenderingMode(.alwaysOriginal),
//                                      selectedImage: UIImage(named: "ico_translate_2")?.withRenderingMode(.alwaysOriginal))
//        vcs.append(vc1)
//        
//        let vc2 = UIViewController()
//        vc2.tabBarItem = UITabBarItem(title: "学习",
//                                      image: UIImage(named: "ico_learn_1")?.withRenderingMode(.alwaysOriginal),
//                                      selectedImage: UIImage(named: "ico_learn_2")?.withRenderingMode(.alwaysOriginal))
//        vcs.append(vc2)
//        
//        let vc3 = UIViewController()
//        vc3.tabBarItem = UITabBarItem(title: "我的",
//                                      image: UIImage(named: "ico_profile_1")?.withRenderingMode(.alwaysOriginal),
//                                      selectedImage: UIImage(named: "ico_profile_2")?.withRenderingMode(.alwaysOriginal))
//        vcs.append(vc3)
        
        tabController?.viewControllers = vcs
        tabController?.tabBar.tintColor = UIColor.themeColor
        
        tabController?.selectedIndex = 0
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = tabController
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

