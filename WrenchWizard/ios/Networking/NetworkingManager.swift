//
//  NetworkingManager.swift
//  WrenchWizard
//
//  Created by Paris Makris on 18/2/24.
//

import Foundation

let BASE_URL = "https://92f1-2a02-587-c432-9f00-69ae-d6c1-719b-cdc1.ngrok-free.app"

class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    var url =  URL(string: BASE_URL)!
    
    private init(){}
    
    func downloadData<T: Codable>(fromURL: String) async -> T? {
        do {
            guard let url = URL(string: fromURL) else { throw NetworkError.badUrlResponse }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }
            return decodedResponse
            
        } catch NetworkError.badUrlResponse {
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
    
    func postData<Req, Res>(fromURL urlString: String, request: Req) async throws -> Res? where Req: Codable, Res: Codable {
        let host: String = BASE_URL
        let path = urlString
        
        var components = URLComponents()
        components.host = host
        components.path = path
        
        guard let url = components.url else {
            throw NetworkError.badStatus
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            urlRequest.httpBody = try JSONEncoder().encode(request)
        } catch {
            print("Encoding request error: \(error)")
            throw error
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
        guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
        guard let decodedResponse = try? JSONDecoder().decode(Res.self, from: data) else { throw NetworkError.failedToDecodeResponse }
        return decodedResponse
    }
    
    func performRequest<T,R>(request: R, endpoint: String) async throws -> T where T: Codable, R: Codable {
        let url = url.appendingPathComponent(endpoint)
        let data = try JSONEncoder().encode(request)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (responseData, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badStatus
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: responseData)
    }
    
    
}

enum NetworkError: Error {
    case badUrlResponse
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
    
}
