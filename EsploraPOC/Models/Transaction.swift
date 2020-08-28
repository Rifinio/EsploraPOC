//
//  Transaction.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import Foundation

struct Transaction{
    let txid: String
    let fee: Satoshi
    var isConfirmed: Bool
}
