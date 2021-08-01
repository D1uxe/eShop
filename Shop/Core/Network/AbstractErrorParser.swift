//
//  AbstractErrorParser.swift
//  Shop
//
//  Created by MacBook Pro on 30.07.2021.
//

import Foundation

protocol AbstractErrorParser {
	func parse(_ result: Error) -> Error
	func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
