//
//  DataRequest+responseCodable.swift
//  Shop
//
//  Created by MacBook Pro on 30.07.2021.
//

import Foundation
import Alamofire

extension DataRequest {

	@discardableResult
	func responseCodable<T: Decodable>(errorParser: AbstractErrorParser,
									   queue: DispatchQueue = .main,
									   completionHandler: @escaping (AFDataResponse<T>) -> Void) -> Self {
		
		let responseSerializer = CustomDecodableSerializer<T>(errorParser: errorParser)
		return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
	}
}
