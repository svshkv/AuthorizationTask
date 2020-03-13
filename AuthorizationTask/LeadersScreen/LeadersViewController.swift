//
//  LeadersViewController.swift
//  AuthorizationTask
//
//  Created by Саша Руцман on 12.03.2020.
//  Copyright © 2020 Саша Руцман. All rights reserved.
//

import UIKit

final class LeadersViewController: UIViewController
{
	private let networkService: INetworkService
	private let token: String
	private var leadersTableView = UITableView()
	var leaders: LeaderDataWrapper?
	let reuseIdentifier = "leader"

	override func loadView() {
		let leadersView = LeadersView()
		view = leadersView
		leadersTableView = leadersView.leadersTableView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		tableViewSetupSettings()
		getLeaders()
	}

	init(token: String, networkService: INetworkService) {
		self.token = token
		self.networkService = networkService
		super.init(nibName: nil, bundle: nil)
	}

	@available (*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func tableViewSetupSettings() {
		leadersTableView.dataSource = self
		leadersTableView.delegate = self
		leadersTableView.register(LeadersTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
	}

	private func getLeaders() {
		networkService.getLeadersRequest(token: token) { [weak self] leadersData in
			guard let self = self else { return }
			switch leadersData {
			case .success(let leaders):
				DispatchQueue.main.async {
					self.leaders = leaders
					self.leadersTableView.reloadData()
				}
			case .failure(let error):
				DispatchQueue.main.async {
					self.showAlert(message: error.localizedDescription)
				}
			}
		}
	}

	private func showAlert(message: String) {
		let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
}
