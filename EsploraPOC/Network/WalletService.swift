//
//  WalletService.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import Foundation

struct AppURL {
    static var baseUrl: String = "https://blockstream.info/testnet/api"
    static var addressPath: String = "/address/"
}

struct URLBuilder {
    static var addressUrlString: String {
        return AppURL.baseUrl + AppURL.addressPath
    }
}
// service layer on top of the HTTPClient which has no business logic.
// you can create service for each part of the app like, AuthenticationService for ex.
class WalletService {
    
    private let client: HttpClient
    init(httpClient: HttpClient) {
        self.client = httpClient
    }
    
    func loadWallet(address: String, completion: @escaping (Result<Wallet, Error>) -> Void) {
        guard let url = URL(string: "\(URLBuilder.addressUrlString)\(address)") else { return }
        print(url.absoluteString)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        client.send(request) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                let str = String(data: data, encoding: .utf8)
                print(str)
                let wallet = Wallet(address: "")
                completion(.success(wallet))
            }
        }
    }
}
