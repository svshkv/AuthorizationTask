//
//  NetworkErrors.swift
//  AuthorizationTask
//
//  Created by Саша Руцман on 12.03.2020.
//  Copyright © 2020 Саша Руцман. All rights reserved.
//

import Foundation

enum NetworkError: Error
{
	case sessionError
	case dataError
}

extension NetworkError: LocalizedError
{
	var errorDescription: String? {
		switch self {
		case .sessionError:
			return NSLocalizedString("Check your internet connection", comment: "")
		case .dataError:
			return NSLocalizedString("Error loading", comment: "")
		}
	}
}
