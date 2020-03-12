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
	private let networkService: INetworkService

	override func loadView() {
		let authView = AuthView()
		self.view = authView
		OKButton = authView.OKButton
		loginTextField = authView.loginTextField
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		addButtonAction()
	}

	init(networkService: INetworkService) {
		self.networkService = networkService
		super.init(nibName: nil, bundle: nil)
	}

	@available (*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func addButtonAction() {
		OKButton.addTarget(self, action: #selector(okButtonPressed), for: .touchUpInside)
	}

	@objc private func okButtonPressed() {
		if let login = loginTextField.text, login.isEmpty == false {
			networkService.postUserRequest(name: login) { postResponseData in
				switch postResponseData {
				case .success(let data):
					print(data)
				case .failure(let error):
					print(error)
				}
			}
		}
		else {
			print("isEmpty")
		}
		//self.present(LeadersViewController(), animated: true, completion: nil)
		//navigationController?.pushViewController(LeadersViewController(), animated: true)
	}
}
