//
//  AppDelegate.swift
//  MyChat
//
//  Created by Mila on 2022/04/06.
//

import Foundation
import UIKit
import Firebase


class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
