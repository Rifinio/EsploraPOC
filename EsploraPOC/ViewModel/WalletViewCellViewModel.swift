//
//  WalletViewCellViewModel.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 28/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import Foundation

struct WalletViewCellViewModel {
    var address: String
    var balance: Btc
    var converted: Decimal
    var backgroundImageName: String = "card-bg"
    var cryptoImageName: String = "icon-btc"
    var convertedString: String {
        return "= $ \(converted)"
    }
}
extension WalletViewCellViewModel {
    init(wallet: Wallet) {
        address = wallet.address
        balance = wallet.balance.toBtc
        converted = ConversionService.shared.converToUsd(amount: wallet.balance.toBtc)
    }
}
