//
//  User.swift
//  Shop
//
//  Created by MacBook Pro on 30.07.2021.
//

import Foundation

struct User: Codable {
	
	let id: Int
	let login: String
	let name: String
	let lastname: String
	
	enum CodingKeys: String, CodingKey {
		case id = "id_user"
		case login = "user_login"
		case name = "user_name"
		case lastname = "user_lastname"
	}
}
