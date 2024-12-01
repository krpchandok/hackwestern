//
//  AppDelegate.swift
//  HackWestern
//
//  Created by Kirpa Chandok on 2024-12-01.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Unity.shared.setHostMainWindow(window)

        return true
    }
}
