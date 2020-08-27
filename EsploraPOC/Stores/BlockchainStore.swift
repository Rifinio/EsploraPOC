//
//  BlockchainStore.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import Foundation

class BlockchainStore {
    private let service: WalletService
    var wallets = [Wallet]()
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

    func loadWallets(completion: @escaping ([Wallet]) -> Void) {


        let dispatchGroup = DispatchGroup()
        DispatchQueue.global().async {
            for address in BlockchainStore.addresses {
                dispatchGroup.enter()
                self.loadWallet(address: address) { [weak self] wallet in
                    if let wallet = wallet {
                        print(wallet.address)
                        DispatchQueue.main.async {
                            self?.wallets.append(wallet)
                        }
                        
                    }
                    dispatchGroup.leave()
                }
            }
            
            dispatchGroup.notify(queue: .main) {
                print("finished wallets")
                completion(self.wallets)
            }
        }
    }
    
    init(service: WalletService) {
        self.service = service
    }
    
    func loadWallet(address: String, completion: @escaping (Wallet?) -> Void) {
        service.loadWallet(address: address) { (result) in
            switch result {
            case .success(let wallet):
                completion(wallet)
            case .failure(_):
                completion(nil)
            }
        }
    }
    
}
