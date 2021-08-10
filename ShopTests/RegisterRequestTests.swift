//
//  RegisterRequestTests.swift
//  RegisterRequestTests
//
//  Created by MacBook Pro on 08.08.2021.
//

import XCTest
@testable import Shop

class RegisterRequestTests: XCTestCase {

	var requestFactory: RequestFactory!
	var register: RegisterRequestFactory!
	var changingData: ChangeUserDataRequestFactory!

	override func setUpWithError() throws {

		self.requestFactory = RequestFactory()
		self.register = self.requestFactory.makeRegisterRequestFactory()
		self.changingData = self.requestFactory.makeChangeUserDataRequestFactory()
	}

	override func tearDownWithError() throws {

		self.requestFactory = nil
		self.register = nil
		self.changingData = nil
	}

	func testUserRegister() throws {

		// Given
		let userId = 123
		let userName = "Somebody"
		let password = "mypassword"
		let email = "some@some.ru"
		let gender = "m"
		let creditCard = "9872389-2424-234224-234"
		let bio = "This is good! I think I will switch to another language"

		let promise = expectation(description: "Registration request")

		// When
		register.register(userId	 : userId,
						  userName	 : userName,
						  password	 : password,
						  email		 : email,
						  gender	 : gender,
						  creditCard : creditCard,
						  bio		 : bio) { response in

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

	func testChangeUserData() throws {

		// Given
		let userId = 525
		let userName = "NewName"
		let password = "newPassword"
		let email = "some@some.ru"
		let gender = "m"
		let creditCard = "5500-2424-3233-8415"
		let bio = "Perfect!! It's new version of myself"

		let promise = expectation(description: "ChangingUserData request")

		// When
		changingData.changeData(userId	 	 : userId,
								userName	 : userName,
								password	 : password,
								email		 : email,
								gender	 	 : gender,
								creditCard 	 : creditCard,
								bio		 	 : bio) { response in

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
