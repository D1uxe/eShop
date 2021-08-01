//
//  RequestFactory.swift
//  Shop
//
//  Created by MacBook Pro on 30.07.2021.
//

import Foundation
import Alamofire

class RequestFactory {

	let sessionQueue = DispatchQueue.global(qos: .utility)

	lazy var commonSession: Session = {
		let configuration = URLSessionConfiguration.default
		configuration.httpShouldSetCookies = false
		configuration.headers = .default
		let manager = Session(configuration: configuration)
		return manager
	}()


	func makeErrorParser() -> AbstractErrorParser {
		return ErrorParser()
	}

	func makeAuthRequestFactory() -> AuthRequestFactory {
		
		let errorParser = makeErrorParser()
		return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
	}

	func makeRegisterRequestFactory() -> RegisterRequestFactory {

		let errorParser = makeErrorParser()
		return Registration(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
	}

	func makeChangeUserDataRequestFactory() -> ChangeUserDataRequestFactory {

		let errorParser = makeErrorParser()
		return ChangeUserData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
	}
}

