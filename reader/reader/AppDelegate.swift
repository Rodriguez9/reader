//
//  AppDelegate.swift
//  分栏控制器
//
//  Created by YZH on 2018/11/8.
//  Copyright © 2018年 YZH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let tab = UITabBarController()
        
        let one = oneViewController()
        one.navigationItem.title = "排行榜"
        let nav1 = UINavigationController(rootViewController: one)
        nav1.navigationBar.barTintColor = UIColor.green
        one.title = "排行榜"
        tab.addChildViewController(nav1)
        //one.tabBarItem.image = UIImage.init(named: "1")
        
        let two = twoViewController()
        two.title = "分类"
        let nav2 = UINavigationController(rootViewController: two)
        nav2.navigationBar.barTintColor = UIColor.green
        two.navigationItem.title = "分类"
        tab.addChildViewController(nav2)
        //two.tabBarItem.image = UIImage.init(named: "2")
        
        let three = threeViewController()
        three.title = "更多"
        let nav3 = UINavigationController(rootViewController: three)
        nav3.navigationBar.barTintColor = UIColor.green
        three.navigationItem.title = "更多"
        tab.addChildViewController(nav3)
        //three.tabBarItem.image = UIImage.init(named: "3")
        //tab.viewControllers = [one,two,three]
        
        self.window?.rootViewController = tab
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

