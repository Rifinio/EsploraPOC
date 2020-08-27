//
//  HttpClient.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noDataOrError
}

// HttpClient responsible only for making requests and handling responses.
// Can easily inject a networking framwork to do the complex work
class HttpClient {
    static let shared = HttpClient()
    let session: URLSession = URLSession(configuration: .default)
    
    func send(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            let result: Result<Data, Error>
            if let error = error {
                result = .failure(error)
            } else if let data = data {
                result = .success(data)
            } else {
                result = .failure(NetworkError.noDataOrError)
            }
            
            DispatchQueue.main.async {
                completion(result)
            }
        }
        
        task.resume()
    }
}

