//
//  AppDelegate.swift
//  Huahui
//
//  Created by Lex on 26/02/2017.
//  Copyright © 2017 lexrus.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = WordsList()
        window?.makeKeyAndVisible()

        return true
    }

}
