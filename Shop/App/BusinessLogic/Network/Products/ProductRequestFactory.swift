//
//  ProductRequestFactory.swift
//  Shop
//
//  Created by MacBook Pro on 06.08.2021.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {

	func getCatalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<[Product]>) -> Void)
	func getProduct(productId: Int, completionHandler: @escaping (AFDataResponse<Product>) -> Void)
}
