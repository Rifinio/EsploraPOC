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
    
    private let blockChainStore: BlockchainStore
    init(blockChainStore: BlockchainStore) {
        self.blockChainStore = blockChainStore
    }
    
    func loadWallets(completion: ([Wallet])->Void) {
        blockChainStore.loadWallets { [weak self] wallets in
            guard let self = self else { return }
            self.wallets = wallets
            completion(wallets)
        }
    }
    
    func viewModelForCellAt(indexPath: IndexPath) -> WalletViewCellViewModel {

        blockChainStore.loadWallet(wallet: wallets[indexPath.row]) { _ in
            print("loaded")
        }
        return WalletViewCellViewModel(wallet: wallets[indexPath.row])
        
    }
}
