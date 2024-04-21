//
//  NetworkingManager.swift
//  WrenchWizard
//
//  Created by Paris Makris on 18/2/24.
//

import Foundation

let BASE_URL = "https://eeb8-2a02-587-c404-f700-bd03-e91b-9c7b-b7f7.ngrok-free.app"

class NetworkingManager: Codable {
    
    static let shared = NetworkingManager()
    
    private init(){}
    
    func downloadData<T: Codable>(fromURL: String) async -> T? {
            do {
                guard let url = URL(string: fromURL) else { throw NetworkError.badUrl }
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
                guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
                guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }
                return decodedResponse
                
            } catch NetworkError.badUrl {
                print("There was an error creating the URL")
            } catch NetworkError.badResponse {
                print("Did not get a valid response")
            } catch NetworkError.badStatus {
                print("Did not get a 2xx status code from the response")
            } catch NetworkError.failedToDecodeResponse {
                print("Failed to decode response into the given type")
            } catch {
                print("An error occured downloading the data")
            }
            
            return nil
        }
    
    
    
}

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}
