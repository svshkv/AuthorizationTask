//
//  LeadersTableView.swift
//  AuthorizationTask
//
//  Created by Саша Руцман on 13.03.2020.
//  Copyright © 2020 Саша Руцман. All rights reserved.
//

import UIKit

extension LeadersViewController: UITableViewDataSource
{

	func numberOfSections(in tableView: UITableView) -> Int {
		return 5
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
													   for: indexPath) as? LeadersTableViewCell else { return UITableViewCell() }
		if indexPath.section == 0 {
			cell.positionLabel.layer.borderColor = #colorLiteral(red: 0.5754188895, green: 0.8283958435, blue: 0.2288650274, alpha: 1)
			cell.positionLabel.layer.borderWidth = 4
		}
		cell.usernameLabel.text = leaders?.rows[indexPath.section].User.name
		cell.pointsLabel.text = "\(String(describing: leaders?.rows[indexPath.section].totalScore ?? 0))"
		cell.positionLabel.text = String(indexPath.section + 1)
		cell.photoView.image = #imageLiteral(resourceName: "image")
		return cell
	}
}

extension LeadersViewController: UITableViewDelegate
{
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 16
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = UIView()
		headerView.backgroundColor = .black
		return headerView
	}
}
