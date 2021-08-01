//
//  ChangeUserDataRequestFactory.swift
//  Shop
//
//  Created by MacBook Pro on 01.08.2021.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {

	func changeData(userId: Int,
						userName: String,
						password: String,
						email: String,
						gender: String,
						creditCard: String,
						bio: String,
						completionHandler: @escaping (AFDataResponse<GeneralResult>) -> Void)
}
