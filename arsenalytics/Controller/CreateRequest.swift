//  Created by Kacper Jagiello on 25/12/2019.
//  Copyright © 2019 jagiello.com. All rights reserved.

import Foundation

enum responseError: Error {
    case cannotReceiveData
    case errorAfterReceivingData
}

struct CreateRequest {
    
    let resourceRequest: URLRequest
    let authenticationToken: String = "f5d100630ebb4f4cbaa86bd49b8fd3b9"

    init(fromAdress resourceAdress: String) {
        let resourceAdressToURL = URL(string: resourceAdress)
        var resourceAdressToURLRequest = URLRequest(url: resourceAdressToURL!)
        resourceAdressToURLRequest.httpMethod = "GET"
        resourceAdressToURLRequest.setValue(authenticationToken, forHTTPHeaderField: "X-Auth-Token")

        self.resourceRequest = resourceAdressToURLRequest
    }
    
    func getStandingsData(completion: @escaping(Result<PremierLeague, responseError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceRequest) { receivedData,_,_ in

            guard let jsonData = receivedData else {
                completion(.failure(.cannotReceiveData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedStandingsData = try decoder.decode(PremierLeague.self, from: jsonData)
                let standingsData = decodedStandingsData
//                let standingsData = decodedStandingsData.standings.self[0].table

                completion(.success(standingsData))
            } catch {
                completion(.failure(.errorAfterReceivingData))
            }
        }
        dataTask.resume()
    }
    
    func getTeamData(completion: @escaping(Result<[TeamDetails], responseError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceRequest) { receivedData,_,_ in

            guard let jsonData = receivedData else {
                completion(.failure(.cannotReceiveData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedClubData = try decoder.decode(TeamList.self, from: jsonData)
                let clubData = decodedClubData.teams

                completion(.success(clubData))
            } catch {
                completion(.failure(.errorAfterReceivingData))
            }
        }
        dataTask.resume()
    }
    
    func getSquadData(completion: @escaping(Result<Squad, responseError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceRequest) { receivedData,_,_ in

            guard let jsonData = receivedData else {
                completion(.failure(.cannotReceiveData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedClubData = try decoder.decode(Squad.self, from: jsonData)
                let clubData = decodedClubData

                completion(.success(clubData))
            } catch {
                completion(.failure(.errorAfterReceivingData))
            }
        }
        dataTask.resume()
    }
    
    
    func getFixtures(completion: @escaping(Result<Fixtures, responseError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceRequest) { receivedData,_,_ in

            guard let jsonData = receivedData else {
                completion(.failure(.cannotReceiveData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedClubData = try decoder.decode(Fixtures.self, from: jsonData)
                let clubData = decodedClubData

                completion(.success(clubData))
            } catch {
                completion(.failure(.errorAfterReceivingData))
            }
        }
        dataTask.resume()
    }
}
