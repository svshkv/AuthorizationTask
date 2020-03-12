//
//  DictExtension.swift
//  AuthorizationTask
//
//  Created by Саша Руцман on 12.03.2020.
//  Copyright © 2020 Саша Руцман. All rights reserved.
//

import Foundation

extension Dictionary
{
	func percentEncoded() -> Data? {
		return map { key, value in
			let escapedKey = "\(key)".addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed) ?? ""
			let escapedValue = "\(value)".addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed) ?? ""
			return escapedKey + "=" + escapedValue
		}
		.joined(separator: "&")
		.data(using: .utf8)
	}
}
