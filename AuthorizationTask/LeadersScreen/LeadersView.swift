//
//  LeadersView.swift
//  AuthorizationTask
//
//  Created by Саша Руцман on 12.03.2020.
//  Copyright © 2020 Саша Руцман. All rights reserved.
//

import UIKit

final class LeadersView: UIView
{
	private let backgroundTableViewView: UIView = {
		let view = UIView()
		view.layer.borderWidth = 4
		view.layer.borderColor = #colorLiteral(red: 0.3197941482, green: 0.6925129294, blue: 0.1704572141, alpha: 1)
		return view
	}()
	let leadersTableView: UITableView = {
		let tableView = UITableView()
		let backgroundView = UIView()
		backgroundView.backgroundColor = .black
		tableView.backgroundView = backgroundView
		return tableView
	}()
	private let topLabel: UILabel = {
		let label = UILabel()
		label.text = "Top"
		label.textColor = UIColor.white
		label.textAlignment = .center
		label.font = UIFont(name: "Helvetica-Bold", size: 52)
		return label
	}()
	private let bottomView: UIView = {
		let view = UIView()
		view.backgroundColor = #colorLiteral(red: 0.2235063612, green: 0.2235441506, blue: 0.2234980762, alpha: 1)
		return view
	}()
	private let stubView1: UIView = {
		let view = UIView()
		view.backgroundColor = .black
		view.layer.cornerRadius = 5
		return view
	}()
	private let stubView2: UIView = {
		let view = UIView()
		view.backgroundColor = .black
		view.layer.cornerRadius = 5
		return view
	}()
	private let stubView3: UIView = {
		let view = UIView()
		view.backgroundColor = .black
		view.layer.cornerRadius = 5
		return view
	}()
	private let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = NSLayoutConstraint.Axis.horizontal
		stackView.distribution = UIStackView.Distribution.fillEqually
		stackView.alignment = UIStackView.Alignment.fill
		stackView.spacing = 4
		return stackView
	}()

	init() {
		super.init(frame: .zero)
		self.backgroundColor = .black
		addViews()
		makeConstraints()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func addViews() {
		addSubview(topLabel)
		addSubview(backgroundTableViewView)
		backgroundTableViewView.addSubview(leadersTableView)
		addSubview(bottomView)
		stackView.addArrangedSubview(stubView1)
		stackView.addArrangedSubview(stubView2)
		stackView.addArrangedSubview(stubView3)
		bottomView.addSubview(stackView)
	}

	private func makeConstraints() {
		topLabel.translatesAutoresizingMaskIntoConstraints = false
		leadersTableView.translatesAutoresizingMaskIntoConstraints = false
		bottomView.translatesAutoresizingMaskIntoConstraints = false
		backgroundTableViewView.translatesAutoresizingMaskIntoConstraints = false
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stubView1.translatesAutoresizingMaskIntoConstraints = false
		stubView2.translatesAutoresizingMaskIntoConstraints = false
		stubView3.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			topLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
			topLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
			topLabel.topAnchor.constraint(equalTo: topAnchor, constant: 36),
			topLabel.heightAnchor.constraint(equalToConstant: 84),
			backgroundTableViewView.leftAnchor.constraint(equalTo: leftAnchor, constant: 2),
			backgroundTableViewView.rightAnchor.constraint(equalTo: rightAnchor, constant: -2),
			backgroundTableViewView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 8),
			backgroundTableViewView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -84),
			leadersTableView.leftAnchor.constraint(equalTo: backgroundTableViewView.leftAnchor, constant: 24),
			leadersTableView.rightAnchor.constraint(equalTo: backgroundTableViewView.rightAnchor, constant: -24),
			leadersTableView.topAnchor.constraint(equalTo: backgroundTableViewView.topAnchor, constant: 20),
			leadersTableView.bottomAnchor.constraint(equalTo: backgroundTableViewView.bottomAnchor, constant: -8),
			bottomView.leftAnchor.constraint(equalTo: leftAnchor),
			bottomView.rightAnchor.constraint(equalTo: rightAnchor),
			bottomView.topAnchor.constraint(equalTo: leadersTableView.bottomAnchor, constant: 8),
			bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
			stackView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 4),
			stackView.leftAnchor.constraint(equalTo: bottomView.leftAnchor),
			stackView.rightAnchor.constraint(equalTo: bottomView.rightAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
		])
	}
}
