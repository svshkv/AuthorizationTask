//
//  NetworkService.swift
//  AuthorizationTask
//
//  Created by Саша Руцман on 12.03.2020.
//  Copyright © 2020 Саша Руцман. All rights reserved.
//

import UIKit

typealias DataResult = Result<Data, NetworkError>
typealias PostRequestResult = Result<PostResponseData, NetworkError>

protocol INetworkService
{
	func postUserRequest(name: String, _ completion: @escaping (PostRequestResult) -> Void)
}

final class NetworkService
{
	private let fetchDataQueue = DispatchQueue(label: "fetchDataQueue",
											   qos: .userInteractive,
											   attributes: .concurrent)

	private func fetchData(request: URLRequest, _ completion: @escaping(DataResult) -> Void) {
		let task = URLSession.shared.dataTask(with: request) { data, _, error in
			self.fetchDataQueue.async {
				if error != nil {
					completion(.failure(.sessionError))
					return
				}
				if let data = data {
					completion(.success(data))
				}
			}
		}
		task.resume()
	}

	private func createPostRequest(name: String) -> URLRequest? {
		guard let url = URL(string: Urls.baseUrl) else { return nil }
		var request = URLRequest(url: url)
		request.addValue("application/json", forHTTPHeaderField: "content-type")
		request.httpMethod = "POST"
		//let uid = UIDevice.current.identifierForVendor?.uuidString ?? "uid"
		let uid = UUID().uuidString
		print(uid)
		let parameters: [String: Any] = [
			"name": name,
			"uid": uid,
		]
		guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return nil }
		request.httpBody = httpBody
		return request
	}
}

extension NetworkService: INetworkService
{
	func postUserRequest(name: String, _ completion: @escaping (PostRequestResult) -> Void) {
		if let request = createPostRequest(name: name) {
			fetchData(request: request) { dataResult in
				switch dataResult {
				case .success(let data):
					do {
						let postUserResponse = try JSONDecoder().decode(PostResponseData.self, from: data)
						completion(.success(postUserResponse))
					}
					catch {}
				case .failure(let error):
					completion(.failure(error))
				}
			}
		}
	}
}
