//
//  LeaderModel.swift
//  AuthorizationTask
//
//  Created by Саша Руцман on 13.03.2020.
//  Copyright © 2020 Саша Руцман. All rights reserved.
//	swiftlint:disable identifier_name

import Foundation

struct LeaderDataWrapper: Decodable
{
	let count: Int
	let rows: [LeaderData]
}

struct LeaderData: Decodable
{
	let User: UserInfo
	let totalScore: Int
}

struct UserInfo: Decodable
{
	let name: String
}
