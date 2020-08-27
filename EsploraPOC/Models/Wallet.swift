//
//  Wallet.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import Foundation

struct RemoteWallet: Decodable {
    struct ChainStats: Decodable{
        var funded_txo_sum: Double // for simptlicity i am declaring the same names as in JSON, We can use codingKeys to put specific names to decode from the json.
    }
    let address: String
    let chain_stats: ChainStats
}

struct Wallet {
    let address: String
    var balance: Double
    var transactions: [Transaction]
}

extension Wallet {
    init(address: String) {
        self.address = address
        balance = 0.0
        transactions = [Transaction]()
    }
    
    init(remoteWallet: RemoteWallet) {
        address = remoteWallet.address
        balance = remoteWallet.chain_stats.funded_txo_sum
        transactions = [Transaction]()
    }
}
