//
//  AuthRequestTests.swift
//  ShopTests
//
//  Created by MacBook Pro on 08.08.2021.
//

import XCTest
@testable import Shop

class AuthRequestTests: XCTestCase {
	
	var requestFactory: RequestFactory!
	var auth: AuthRequestFactory!

	override func setUpWithError() throws {

		self.requestFactory = RequestFactory()
		self.auth = self.requestFactory.makeAuthRequestFactory()
	}

	override func tearDownWithError() throws {

		self.requestFactory = nil
		self.auth = nil
	}

	func testLogIn() throws {

		// Given
		let userName = "Somebody"
		let password = "mypassword"

		let promise = expectation(description: "LogIn request") 

		// When
		auth.logIn(userName: userName, password: password) { response in

		// Then
			switch response.result {
				case .success(let login):
					XCTAssertEqual(login.result, 1)

				case .failure(let error):
					XCTFail(error.localizedDescription)
			}
			promise.fulfill()
		}
		wait(for: [promise], timeout: 10)
	}

	func testLogOut() throws {

		// Given
		let userId = 123

		let promise = expectation(description: "LogOut request")

		// When
		auth.logOut(userId: userId) { response in

		// Then 
			switch response.result {

				case .success(let result):
					XCTAssertEqual(result.result, 1)

				case .failure(let error):
					XCTFail(error.localizedDescription)
			}
			promise.fulfill()
		}
		wait(for: [promise], timeout: 10)
	}

}
