//
//  RegisterRequestFactory.swift
//  Shop
//
//  Created by MacBook Pro on 31.07.2021.
//

import Foundation
import Alamofire

protocol RegisterRequestFactory {

	func register(userId: Int,
				  userName: String,
				  password: String,
				  email: String,
				  gender: String,
				  creditCard: String,
				  bio: String,
				  completionHandler: @escaping (AFDataResponse<GeneralResult>) -> Void)
}
