//
//  AppDelegate.swift
//  iprotechs_Task
//
//  Created by SANKAR on 19/03/21.
//

import UIKit
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if  let getUserData = Utilities.shared.getUserDefault(objectKey: userLoginKey) as? [String:String]{
            print(getUserData)
            let orderVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "OrderViewController") as? OrderViewController
            let navigation = UINavigationController(rootViewController: orderVC ?? UIViewController())
            self.window?.rootViewController = navigation
        }else{
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewController") as? LoginViewController
            self.window?.rootViewController = vc
        }
       
        return true
    }

   

}

