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
        var funded_txo_sum: Satoshi // for simptlicity i am declaring the same names as in JSON, We can use codingKeys to put specific names to decode from the json.
    }
    let address: String
    let chain_stats: ChainStats
}

struct Wallet {
    let address: String
    var balance: Satoshi
    var transactions: [Transaction]
}

extension Wallet {
    init(address: String) {
        self.address = address
        balance = 1
        transactions = [Transaction]()
    }
    
    init(remoteWallet: RemoteWallet) {
        address = remoteWallet.address
        balance = remoteWallet.chain_stats.funded_txo_sum
        transactions = [Transaction]()
    }
}

typealias Satoshi = UInt64 // 100.000.000 sats per btc so the absolute max of existing sats is 21.000.000 * 100.000.000 < UInt64.max
typealias Btc = Decimal // Using Decimal because it's more accurate than float or double for money.
extension Satoshi {
    var toBtc: Btc {
        return Decimal(self) / Decimal(100000000)
    }
}

extension Btc {
    var toSatoshi: Satoshi {
        return UInt64((self * Decimal(1000000000)).intValue)
    }
}

extension Decimal {
    var intValue: Int64 {
        return NSDecimalNumber(decimal: self).int64Value
    }
}
