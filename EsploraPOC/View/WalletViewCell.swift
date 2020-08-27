//
//  WalletViewCell.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import UIKit

struct WalletViewCellViewModel {
    var address: String
}
extension WalletViewCellViewModel {
    init(wallet: Wallet) {
        address = wallet.address
    }
}

class WalletViewCell: UICollectionViewCell {
    static let identifier = "WalletViewCellId"
    private let addressLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        theme()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModel: WalletViewCellViewModel) {
        addressLabel.text = viewModel.address
    }
}

extension WalletViewCell: ViewSetupable {
    func theme() {
        addressLabel.font = AppStyle.Font.smallTitle
        addressLabel.textColor = AppStyle.Color.accent
    }
    
    func setupView() {
        contentView.addSubview(addressLabel)
    }
    
    func setupConstraints() {
        addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        addressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
}
