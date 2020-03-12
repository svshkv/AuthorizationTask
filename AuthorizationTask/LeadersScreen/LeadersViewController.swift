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
	let reuseIdentifier = "leader"

	override func loadView() {
		let leadersView = LeadersView()
		view = leadersView
		leadersTableView = leadersView.leadersTableView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		tableViewSetupSettings()
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
}
