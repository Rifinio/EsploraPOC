//
//  WalletsOverviewViewModel.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import Foundation

class WalletsOverviewViewModel {
    var wallets = [Wallet]()
    var balanceTitle: String = ""
    
    private let blockChainStore: BlockchainStore
    init(blockChainStore: BlockchainStore) {
        self.blockChainStore = blockChainStore
    }
    
    func loadWallets(completion: @escaping ([Wallet])->Void) {
        blockChainStore.loadWallets { [weak self] wallets in
            guard let self = self else { return }
            self.wallets = wallets
            var total = 0.0
            for w in wallets {
                total += w.balance
            }
            self.balanceTitle = "Total Balance: \(total) btc"
            completion(wallets)
        }
    }
    
    func viewModelForCellAt(indexPath: IndexPath) -> WalletViewCellViewModel {
        return WalletViewCellViewModel(wallet: wallets[indexPath.row])
    }
}
