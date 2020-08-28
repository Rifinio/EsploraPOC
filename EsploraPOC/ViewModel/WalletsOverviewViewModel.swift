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
    
    private let blockChainStore: BlockchainStoreProtocol
    init(blockChainStore: BlockchainStoreProtocol) {
        self.blockChainStore = blockChainStore
    }
    
    func loadWallets(completion: @escaping ([Wallet])->Void) {
        blockChainStore.loadWallets { [weak self] wallets in
            guard let self = self else { return }
            self.wallets = self.sortedWallets(wallets: wallets)
            var total: Satoshi = 0
            for w in wallets {
                total += w.balance
            }
            let convertedPrice = ConversionService.shared.converToUsd(amount: total.toBtc)
            self.balanceTitle = "Total Balance\n" + "\(total.toBtc) btc = $ \(convertedPrice)".uppercased()
            completion(wallets)
        }
    }
    
    func viewModelForCellAt(indexPath: IndexPath) -> WalletViewCellViewModel {
        return WalletViewCellViewModel(wallet: wallets[indexPath.row])
    }
    
    private func sortedWallets(wallets: [Wallet]) -> [Wallet] {
        return wallets.sorted { $0.balance > $1.balance }
    }
}
