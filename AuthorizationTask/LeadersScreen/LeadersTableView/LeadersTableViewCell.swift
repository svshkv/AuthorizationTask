//
//  LeadersTableViewCell.swift
//  AuthorizationTask
//
//  Created by Саша Руцман on 13.03.2020.
//  Copyright © 2020 Саша Руцман. All rights reserved.
//

import UIKit

final class LeadersTableViewCell: UITableViewCell
{
	let positionLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = .green
		return label
	}()
	let usernameLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = .green
		return label
	}()
	let pointsLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = .green
		return label
	}()
	let photoView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .green
		return imageView
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = #colorLiteral(red: 0.04424589127, green: 0.1367008984, blue: 0.01226530783, alpha: 1)
		addViews()
		makeConstraints()
	}

	@available (*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func addViews() {
		addSubview(positionLabel)
		addSubview(usernameLabel)
		addSubview(pointsLabel)
		addSubview(photoView)
	}

	private func makeConstraints() {
		positionLabel.translatesAutoresizingMaskIntoConstraints = false
		usernameLabel.translatesAutoresizingMaskIntoConstraints = false
		pointsLabel.translatesAutoresizingMaskIntoConstraints = false
		photoView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			positionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
			positionLabel.widthAnchor.constraint(equalToConstant: 60),
			positionLabel.heightAnchor.constraint(equalToConstant: 60),
			positionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			usernameLabel.leftAnchor.constraint(equalTo: positionLabel.rightAnchor, constant: 24),
			usernameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
			usernameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
			usernameLabel.heightAnchor.constraint(equalToConstant: 24),
			photoView.leftAnchor.constraint(equalTo: positionLabel.rightAnchor, constant: 16),
			photoView.widthAnchor.constraint(equalToConstant: 34),
			photoView.heightAnchor.constraint(equalToConstant: 34),
			photoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
			pointsLabel.leftAnchor.constraint(equalTo: photoView.rightAnchor, constant: 12),
			pointsLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
			pointsLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8),
			pointsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
		])
	}
}
