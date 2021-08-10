//
//  ObtainProduct.swift
//  Shop
//
//  Created by MacBook Pro on 06.08.2021.
//

import Foundation
import Alamofire

class ObtainProduct: AbstractRequestFactory {

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

extension ObtainProduct: ProductRequestFactory {

	func getCatalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<[Product]>) -> Void) {

		let requestModel = Catalog(pageNumber	 : pageNumber,
								 categoryId: categoryId)

		self.request(request: requestModel, completionHandler: completionHandler)
	}


	func getProduct(productId: Int, completionHandler: @escaping (AFDataResponse<Product>) -> Void) {

		let requestModel = Good(productId: productId)

		self.request(request: requestModel, completionHandler: completionHandler)
	}
}



extension ObtainProduct {

	struct Catalog: RequestRouter {

		let path: String = "catalogData.json"
		let method: HTTPMethod = .get

		let pageNumber: Int
		let categoryId: Int
		var parameters: Parameters? {

			return ["page_number": pageNumber,
					"id_category": categoryId
			]
		}
	}

	struct Good: RequestRouter {

		let path: String = "getGoodById.json"
		let method: HTTPMethod = .get

		let productId: Int
		var parameters: Parameters? {

			return ["id_product": productId]
		}
	}

}
