//
//  BlockchainStore.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import Foundation

class BlockchainStore {
    static let addresses: [String] = [
        "tb1qvjc7jq8szaln85wutm6dsxgjm7vw8vk9ypdtgz",
        "tb1qn3lrfwgpxhrmt5qef0x9s9er40wevuz2aqglz6",
        "tb1qjynddzmv8q84nagl5hhxfzuhmcy8c4q0whrewd",
        "tb1qdtjlxhugk7d3gj298jqkgfg8tqu02uj44karmd",
        "tb1qjunsfrk5jvvzzfej2smt4thk878ljceu9fp900",
        "tb1q2v9uac0uzc6zd2f997pzjzukycjxd6chlht4hu",
        "tb1qha2q5yu3j02s9vjpnarxz8fy8xgvxqqgl5gvd3",
        "tb1qa2c7d6zfff90lphxpmrs3mteza86wffdypvgv8",
        "tb1qrry6ycll2x0h2r6jfnz8u2lzcl03zv4nahhxjl",
        "tb1qpsuz7zn3ff3t636yyrh4v2u8fkenh2n7d66mug",
    ]
    
    func loadWallets(completion: ([Wallet]) -> Void) {
        let wallets = BlockchainStore.addresses.map { return Wallet(address: $0)}
        completion(wallets)
    }
}
