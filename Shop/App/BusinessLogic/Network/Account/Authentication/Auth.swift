//
//  Auth.swift
//  Shop
//
//  Created by MacBook Pro on 30.07.2021.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {

	let errorParser: AbstractErrorParser
	let sessionManager: Session
	let queue: DispatchQueue

	init(errorParser: AbstractErrorParser,
		 sessionManager: Session,
		 queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {

		self.errorParser = errorParser
		self.sessionManager = sessionManager
		self.queue = queue
	}
}

extension Auth: AuthRequestFactory {

	func logIn(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {

		let requestModel = LogIn(login	 : userName,
								 password: password)

		self.request(request: requestModel, completionHandler: completionHandler)
	}


	func logOut(userId: Int, completionHandler: @escaping (AFDataResponse<GeneralResult>) -> Void) {

		let requestModel = LogOut(userId: userId)

		self.request(request: requestModel, completionHandler: completionHandler)
	}
}



extension Auth {

	struct LogIn: RequestRouter {
		
		let path: String = "login.json"

		let login: String
		let password: String
		var parameters: Parameters? {

			return ["username": login,
					"password": password
			]
		}
	}

	struct LogOut: RequestRouter {

		let path: String = "logout.json"

		let userId: Int
		var parameters: Parameters? {

			return ["id_user": userId]
		}
	}

}

