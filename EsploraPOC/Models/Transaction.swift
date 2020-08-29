//
//  Transaction.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import Foundation

struct Transaction{
    enum TransactionSign {
        case `in`
        case out
    }

    let sign: TransactionSign
    let txid: String
    let fromAdress: String
    let toAdress: String
    let fee: Satoshi
    var isConfirmed: Bool
}

extension Transaction {
    static func mockTransactions() -> [Transaction] {
        let t1 = Transaction(sign: .in,
                             txid: "txidtxidtxidtxid",
                             fromAdress: "fromtxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxid",
                             toAdress: "totxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxiddd",
                             fee: 32,
                             isConfirmed: true)
        let t2 = Transaction(sign: .in,
                             txid: "txidtxidtxidtxid",
                             fromAdress: "fromtxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxid",
                             toAdress: "totxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxiddd",
                             fee: 123,
                             isConfirmed: false)
        let t3 = Transaction(sign: .in,
                             txid: "txidtxidtxidtxid",
                             fromAdress: "fromtxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxid",
                             toAdress: "totxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxiddd",
                             fee: 111,
                             isConfirmed: false)
        let t4 = Transaction(sign: .in,
                             txid: "txidtxidtxidtxid",
                             fromAdress: "fromtxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxid",
                             toAdress: "totxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxidtxiddd",
                             fee: 888,
                             isConfirmed: true)
        
        return [t1, t2, t3, t4, t3, t1, t1, t4, t2, t1, t1, t2, t3, t4, t3, t1, t1, t4, t2, t1]
    }
}
