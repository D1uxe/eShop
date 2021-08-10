//
//  SceneDelegate.swift
//  Shop
//
//  Created by MacBook Pro on 23.07.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	let requestFactory = RequestFactory()

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let _ = (scene as? UIWindowScene) else { return }


		let auth = requestFactory.makeAuthRequestFactory()

		auth.logIn(userName: "Somebody", password: "mypassword") { response in

			print("\n ✅✅✅ Authorization LOG IN ✅✅✅")

			switch response.result {

				case .success(let login):
					print("Log In result: \(login)")

				case .failure(let error):
					print(error.localizedDescription)
			}
		}

		auth.logOut(userId: 123) { response in

			print("\n ✅✅✅ Authorization LOG Out ✅✅✅")

			switch response.result {

				case .success(let result):
					print("Log OUT result: \(result)")

				case .failure(let error):
					print(error.localizedDescription)
			}
		}



		let register = requestFactory.makeRegisterRequestFactory()

		register.register(userId	 : 123,
						  userName	 : "Somebody",
						  password	 : "mypassword",
						  email		 : "some@some.ru",
						  gender	 : "m",
						  creditCard : "9872389-2424-234224-234",
						  bio		 : "This is good! I think I will switch to another language") { response in

			print("\n ✅✅✅ REGISTRATION ✅✅✅")

			switch response.result {

				case .success(let result):
					print("Registration result: \(result)")

				case .failure(let error):
					print(error.localizedDescription)
			}
		}



		let changingData = requestFactory.makeChangeUserDataRequestFactory()

		changingData.changeData(userId	 : 123,
								userName	 : "Somebody",
								password	 : "mypassword",
								email		 : "some@some.ru",
								gender	 : "m",
								creditCard : "9872389-2424-234224-234",
								bio		 : "This is good! I think I will switch to another language") { response in

			print("\n ✅✅✅ CHANGE DATA ✅✅✅")

			switch response.result {

				case .success(let result):
					print("Result of chaging data: \(result)")

				case .failure(let error):
					print(error.localizedDescription)
			}
		}




		let product = requestFactory.makeProductRequestFactory()

		product.getCatalog(pageNumber: 1, categoryId: 1) { response in

			print("\n ✅✅✅ PRODUCT. GET CATALOG ✅✅✅")

			switch response.result {

				case .success(let result):
					print("Get catalog result: \(result)")

				case .failure(let error):
					print(error.localizedDescription)
			}
		}


		product.getProduct(productId: 77) { response in

			print("\n ✅✅✅ PRODUCT. GET ONE PRODUCT ✅✅✅")

			switch response.result {

				case .success(let result):
					print("Get product by id result: \(result)")

				case .failure(let error):
					print(error.localizedDescription)
			}
		}

	}

	func sceneDidDisconnect(_ scene: UIScene) {
		// Called as the scene is being released by the system.
		// This occurs shortly after the scene enters the background, or when its session is discarded.
		// Release any resources associated with this scene that can be re-created the next time the scene connects.
		// The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
		// Called when the scene has moved from an inactive state to an active state.
		// Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
	}

	func sceneWillResignActive(_ scene: UIScene) {
		// Called when the scene will move from an active state to an inactive state.
		// This may occur due to temporary interruptions (ex. an incoming phone call).
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
		// Called as the scene transitions from the background to the foreground.
		// Use this method to undo the changes made on entering the background.
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
		// Called as the scene transitions from the foreground to the background.
		// Use this method to save data, release shared resources, and store enough scene-specific state information
		// to restore the scene back to its current state.
	}


}

