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
    var balance: Btc
}
extension WalletViewCellViewModel {
    init(wallet: Wallet) {
        address = wallet.address
        balance = wallet.balance.toBtc
    }
}

class WalletViewCell: UICollectionViewCell {
    static let identifier = "WalletViewCellId"
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.alignment = .center
        sv.spacing = 10
        return sv
    }()
    private let orderLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private let balanceLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private let addressLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 2
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
        balanceLabel.text = viewModel.balance.formattedWithSymbol
        
        addressLabel.sizeToFit()
    }
}

extension WalletViewCell: ViewSetupable {
    func theme() {
        addressLabel.font = AppStyle.Font.smallTitle
        addressLabel.textColor = AppStyle.Color.accent
        
        orderLabel.textColor = AppStyle.Color.white
        orderLabel.font = AppStyle.Font.smallTitle
        orderLabel.layer.cornerRadius = 5
        orderLabel.layer.borderColor = AppStyle.Color.white.cgColor
        orderLabel.layer.borderWidth = 1.0
        
        balanceLabel.font = AppStyle.Font.smallTitle
        balanceLabel.textColor = AppStyle.Color.accent
    }
    
    func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(orderLabel)
        stackView.addArrangedSubview(addressLabel)
        stackView.addArrangedSubview(balanceLabel)
    }
    
    func setupConstraints() {
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        orderLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
        orderLabel.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
        balanceLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2).isActive = true
    }
}

extension UIView {
    func showBorder(color: UIColor = .red, width: CGFloat = 1.0) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
