//
//  AuthRequestFactory.swift
//  Shop
//
//  Created by MacBook Pro on 30.07.2021.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
	
	func logIn(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
	func logOut(userId: Int, completionHandler: @escaping (AFDataResponse<GeneralResult>) -> Void)
}

