//
//  ChangeUserData.swift
//  Shop
//
//  Created by MacBook Pro on 01.08.2021.
//

import Foundation
import Alamofire

class ChangeUserData : AbstractRequestFactory {

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


extension ChangeUserData: ChangeUserDataRequestFactory {

	func changeData(userId: Int,
					userName: String,
					password: String,
					email: String,
					gender: String,
					creditCard: String,
					bio: String,
					completionHandler: @escaping (AFDataResponse<GeneralResult>) -> Void) {

		let requestModel = ChangingData(userId	  : userId,
										userName  : userName,
										password  : password,
										email	  : email,
										gender	  : gender,
										creditCard: creditCard,
										bio		  : bio)

		self.request(request: requestModel, completionHandler: completionHandler)
	}
}

extension ChangeUserData {

	struct ChangingData: RequestRouter {

		let path: String = "changeUserData.json"

		let userId: Int
		let userName: String
		let password: String
		let email: String
		let gender: String
		let creditCard: String
		let bio: String

		var parameters: Parameters? {

			return ["id_user"  	 : userId,
					"username" 	 : userName,
					"password" 	 : password,
					"email"    	 : email,
					"gender"   	 : gender,
					"credit_card": creditCard,
					"bio" 		 : bio
			]
		}
	}
}
