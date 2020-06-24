//  Created by Kacper Jagiello on 25/12/2019.
//  Copyright © 2019 jagiello.com. All rights reserved.

import Foundation

final class CreateRequest {

    private let resourceRequest: URLRequest

    init(fromAdress resourceAdress: String) {
        let resourceAdressToURL = URL(string: resourceAdress)
        var resourceAdressToURLRequest = URLRequest(url: resourceAdressToURL!)
        resourceAdressToURLRequest.httpMethod = "GET"
        resourceAdressToURLRequest.setValue(AdressBook.authenticationToken, forHTTPHeaderField: "X-Auth-Token")

        resourceRequest = resourceAdressToURLRequest
    }

    func getData<T: Decodable>(ofType: T.Type, completionHandler: @escaping (T?, responseError?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceRequest) {
            receivedData, _, _ in

            guard let jsonData = receivedData else {
                completionHandler(nil, .cannotReceiveData)
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                let decodedData = try jsonDecoder.decode(T.self, from: jsonData)
                let expectedData = decodedData

                completionHandler(expectedData, nil)
            } catch {
                completionHandler(nil, .errorAfterReceivingData)
            }
        }
        dataTask.resume()
    }
}
