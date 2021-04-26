//
//  AppDelegate.swift
//  taskapp
//
//  Created by Ami Hirahara on 2021/04/20.
//

import UIKit
import UserNotifications

@main

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //ユーザに通知の許可を求める
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]){ (granted, error) in
            //Enble or disable features based on authorization
        }
        center.delegate = self
        
        //アプリがフォアグランドの時に通知を受け取ると呼ばれるメソッド
        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping(UNNotificationPresentationOptions) -> Void ) {
            completionHandler([.banner, .list, .sound])
        }
        return true
        // MARK: UISceneSession Lifecycle
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
