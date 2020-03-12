//
//  PostResponseData.swift
//  AuthorizationTask
//
//  Created by Саша Руцман on 12.03.2020.
//  Copyright © 2020 Саша Руцман. All rights reserved.
//

import Foundation

struct PostResponseData: Decodable
{
	let result: String
	let token: String
}
