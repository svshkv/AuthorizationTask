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
	private let defaults = UserDefaults.standard
	private let activityIndicator = UIActivityIndicatorView()

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
			showActivityIndicator()
			networkService.postUserRequest(name: login) { [weak self] postResponseData in
				guard let self = self else { return }
				switch postResponseData {
				case .success(let data):
					DispatchQueue.main.async {
						self.activityIndicator.stopAnimating()
						self.defaults.set(login, forKey: data.token)
						let leadersVC = LeadersViewController(token: data.token, networkService: NetworkService())
						leadersVC.modalPresentationStyle = .fullScreen
						self.present(leadersVC, animated: true, completion: nil)
					}
				case .failure(let error):
					DispatchQueue.main.async {
						self.showAlert(message: error.localizedDescription)
						self.activityIndicator.stopAnimating()
					}
				}
			}
		}
		else {
			showAlert(message: "Please, enter your name.")
		}
	}

	private func showActivityIndicator() {
		activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
		activityIndicator.center = view.center
		activityIndicator.hidesWhenStopped = true
		activityIndicator.style = .large
		view.addSubview(activityIndicator)
		activityIndicator.startAnimating()
	}

	private func showAlert(message: String) {
		let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
}
