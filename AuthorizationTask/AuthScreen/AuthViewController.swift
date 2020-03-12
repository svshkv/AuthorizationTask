//
//  AuthViewController.swift
//  AuthorizationTask
//
//  Created by Саша Руцман on 12.03.2020.
//  Copyright © 2020 Саша Руцман. All rights reserved.
//

import UIKit

final class AuthViewController: UIViewController
{
	private var OKButton = UIButton()
	private var loginTextField = UITextField()
	
	override func loadView() {
		let authView = AuthView()
		self.view = authView
		OKButton = authView.OKButton
		loginTextField = authView.loginTextField
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
