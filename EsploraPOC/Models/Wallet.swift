//
//  Wallet.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import Foundation

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
}
