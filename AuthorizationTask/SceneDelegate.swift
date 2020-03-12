//
//  SceneDelegate.swift
//  AuthorizationTask
//
//  Created by Саша Руцман on 12.03.2020.
//  Copyright © 2020 Саша Руцман. All rights reserved.
//

import UIKit
import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate
{
	var window: UIWindow?

	func scene(_ scene: UIScene,
			   willConnectTo session: UISceneSession,
			   options connectionOptions: UIScene.ConnectionOptions) {
		if let windowScene = scene as? UIWindowScene {
			let window = UIWindow(windowScene: windowScene)
			window.rootViewController = AuthViewController()
			self.window = window
			window.makeKeyAndVisible()
		}
	}

	func sceneDidDisconnect(_ scene: UIScene) {
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
	}

	func sceneWillResignActive(_ scene: UIScene) {
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
	}
}
