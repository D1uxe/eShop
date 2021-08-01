//
//  Registrer.swift
//  Shop
//
//  Created by MacBook Pro on 31.07.2021.
//

import Foundation
import Alamofire

class Registration : AbstractRequestFactory {

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


extension Registration: RegisterRequestFactory {

	func register(userId: Int,
				  userName: String,
				  password: String,
				  email: String,
				  gender: String,
				  creditCard: String,
				  bio: String,
				  completionHandler: @escaping (AFDataResponse<GeneralResult>) -> Void) {

		let requestModel = SignUp(userId	: userId,
								  userName	: userName,
								  password	: password,
								  email		: email,
								  gender 	: gender,
								  creditCard: creditCard,
								  bio		: bio)

		self.request(request: requestModel, completionHandler: completionHandler)
	}
}

extension Registration {

	struct SignUp: RequestRouter {

		let path: String = "registerUser.json"

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
