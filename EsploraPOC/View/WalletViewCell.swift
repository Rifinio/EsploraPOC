//
//  WalletViewCell.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import UIKit

class WalletViewCell: UICollectionViewCell {
    private let addressLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WalletViewCell: ViewSetupable {
    func theme() {
    }
    
    func setupView() {
        contentView.addSubview(addressLabel)
    }
    
    func setupConstraints() {
    }
}
