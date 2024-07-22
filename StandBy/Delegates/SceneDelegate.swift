//
//  SceneDelegate.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/19.
//

import UIKit

class SceneDelegate: NSObject, UIWindowSceneDelegate, ObservableObject {
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        print("scene")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
//        print("sceneWillEnterForeground")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
//        print("sceneDidBecomeActive")
    }

    func sceneWillResignActive(_ scene: UIScene) {
//        print("sceneWillResignActive")
    }

    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
//        print("windowScene \(shortcutItem)")
        shortcutItemToProcess = shortcutItem
    }
}
