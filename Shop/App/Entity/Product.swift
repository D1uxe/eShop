//
//  Product.swift
//  Shop
//
//  Created by MacBook Pro on 06.08.2021.
//

import Foundation

struct Product: Decodable {

	let result: Int
	let id: Int
	let name: String
	let price: Int
	let description: String

	enum CodingKeys: String, CodingKey {
		case result
		case id = "id_product"
		case name = "product_name"
		case price
		case product_price
		case description = "product_description"
	}

	init(from decoder: Decoder) throws {

		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.result = try container.decodeIfPresent(Int.self, forKey: .result) ?? -1
		self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? -1
		self.name = try container.decode(String.self, forKey: .name)
		self.price = try container.decodeIfPresent(Int.self, forKey: .price) ?? container.decode(Int.self, forKey: .product_price)
		self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? "no description"

	}
}
