//
//  AuthView.swift
//  AuthorizationTask
//
//  Created by Саша Руцман on 12.03.2020.
//  Copyright © 2020 Саша Руцман. All rights reserved.
//

import UIKit

final class AuthView: UIView
{
	private var greenContainer: UIView = {
		let greenContainer = UIView()
		greenContainer.backgroundColor = #colorLiteral(red: 0.1390116513, green: 0.3319489956, blue: 0.0617076233, alpha: 1)
		greenContainer.layer.borderWidth = 6
		greenContainer.layer.borderColor = #colorLiteral(red: 0.6013774276, green: 0.84394449, blue: 0.2355333865, alpha: 1)
		greenContainer.layer.cornerRadius = 5
		return greenContainer
	}()
	private var enterNameLabel: UILabel = {
		let label = UILabel()
		label.textColor = UIColor.white
		label.textAlignment = .center
		label.numberOfLines = 1
		label.font = UIFont(name: "Helvetica-Bold", size: 22)
		label.text = "Enter your name:"
		return label
	}()
	var loginTextField: UITextField = {
		let textField = UITextField()
		textField.backgroundColor = #colorLiteral(red: 0.09946546704, green: 0.2530755997, blue: 0.03792304173, alpha: 1)
		textField.attributedPlaceholder = NSAttributedString(string: "User 8463",
															 attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
		textField.layer.cornerRadius = 5
		return textField
	}()
	var OKButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = #colorLiteral(red: 0.3292098939, green: 0.7112923265, blue: 0.1761212647, alpha: 1)
		button.layer.cornerRadius = 5
		button.setTitle("OK", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.bold)
		return button
	}()

	init() {
		super.init(frame: .zero)
		addViews()
		makeConstraints()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func addViews() {
		addSubview(greenContainer)
		greenContainer.addSubview(enterNameLabel)
		greenContainer.addSubview(loginTextField)
		greenContainer.addSubview(OKButton)
	}

	private func makeConstraints() {
		greenContainer.translatesAutoresizingMaskIntoConstraints = false
		enterNameLabel.translatesAutoresizingMaskIntoConstraints = false
		loginTextField.translatesAutoresizingMaskIntoConstraints = false
		OKButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			greenContainer.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 36),
			greenContainer.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -36),
			greenContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 124),
			greenContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200),
			enterNameLabel.topAnchor.constraint(equalTo: greenContainer.topAnchor, constant: 96),
			enterNameLabel.leftAnchor.constraint(equalTo: greenContainer.leftAnchor, constant: 24),
			enterNameLabel.rightAnchor.constraint(equalTo: greenContainer.rightAnchor, constant: -24),
			loginTextField.leftAnchor.constraint(equalTo: greenContainer.leftAnchor, constant: 12),
			loginTextField.rightAnchor.constraint(equalTo: greenContainer.rightAnchor, constant: -12),
			loginTextField.topAnchor.constraint(equalTo: enterNameLabel.bottomAnchor, constant: 8),
			loginTextField.heightAnchor.constraint(equalToConstant: 36),
			OKButton.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 8),
			OKButton.leftAnchor.constraint(equalTo: greenContainer.leftAnchor, constant: 96),
			OKButton.rightAnchor.constraint(equalTo: greenContainer.rightAnchor, constant: -96),
			OKButton.heightAnchor.constraint(equalToConstant: 48),
		])
	}
}
