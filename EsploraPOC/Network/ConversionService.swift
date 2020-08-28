//
//  ConversionService.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 28/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import Foundation

class ConversionService {
    private var btcToUsdPrice: Decimal = Decimal(11123)
    static let shared = ConversionService()
    
    func converToUsd(amount: Btc) -> Decimal {
        return amount * btcToUsdPrice
    }
}
