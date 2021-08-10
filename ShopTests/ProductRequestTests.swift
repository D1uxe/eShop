//
//  ProductRequestTests.swift
//  ShopTests
//
//  Created by MacBook Pro on 10.08.2021.
//

import XCTest
@testable import Shop

class ProductRequestTests: XCTestCase {

	var requestFactory: RequestFactory!
	var product: ProductRequestFactory!

	override func setUpWithError() throws {

		self.requestFactory = RequestFactory()
		self.product = self.requestFactory.makeProductRequestFactory()
	}

	override func tearDownWithError() throws {

		self.requestFactory = nil
		self.product = nil
	}

	func testGetCatalog() throws {

		// Given
		let pageNumber = 1
		let categoryId = 1

		let promise = expectation(description: "Catalog request")

		// When
		product.getCatalog(pageNumber: pageNumber, categoryId: categoryId) { response in

		// Then
			switch response.result {

				case .success(let result):
					XCTAssertGreaterThan(result.count, 0)

				case .failure(let error):
					XCTFail(error.localizedDescription)
			}
			promise.fulfill()
		}
		wait(for: [promise], timeout: 10)
	}

	func testGetProduct() throws {

		// Given
		let productId = 77

		let promise = expectation(description: "Product request")

		// When
		product.getProduct(productId: productId) { response in

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
