//
//  WalletViewCell.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import UIKit

class WalletViewCell: UICollectionViewCell {
    static let identifier = "WalletViewCellId"

    private let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    private let cryptoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    private let balanceLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private let convertedLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private let addressLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 1
        l.minimumScaleFactor = 0.8
        l.adjustsFontSizeToFitWidth = true
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
        backgroundImageView.image = UIImage(named: viewModel.backgroundImageName)
        addressLabel.text = viewModel.address
        balanceLabel.text = viewModel.balance.formattedWithSymbol
        cryptoImageView.image = UIImage(named: viewModel.cryptoImageName)
        convertedLabel.text = viewModel.convertedString
    }
}

extension WalletViewCell: ViewSetupable {
    func theme() {
        showBorder(color: .gray, width: 0.2)
        contentView.layer.cornerRadius = 10.0
        contentView.layer.masksToBounds = true

        addressLabel.font = AppStyle.Font.smallTitle
        addressLabel.textColor = AppStyle.Color.accent
        
        convertedLabel.font = AppStyle.Font.smallTitle
        convertedLabel.textColor = AppStyle.Color.white
        
        balanceLabel.font = AppStyle.Font.largeTitle
        balanceLabel.textColor = AppStyle.Color.accent
    }
    
    func setupView() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(cryptoImageView)
        contentView.addSubview(balanceLabel)
        contentView.addSubview(convertedLabel)
        contentView.addSubview(addressLabel)
    }
    
    func setupConstraints() {
        let insets = UIEdgeInsets(top: 5, left: 5, bottom: -5, right: -5)
        backgroundImageView.pinToEgesOf(view: contentView)

        cryptoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: insets.left).isActive = true
        cryptoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: insets.top).isActive = true
        cryptoImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        cryptoImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: insets.left).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: insets.bottom).isActive = true
        addressLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: insets.right).isActive = true
        
        balanceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: insets.left).isActive = true
        balanceLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: insets.right).isActive = true
        balanceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -20).isActive = true
        
        convertedLabel.leadingAnchor.constraint(equalTo: balanceLabel.leadingAnchor).isActive = true
        convertedLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: insets.right).isActive = true
        convertedLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: insets.top).isActive = true
    }
}

extension UIView {
    func pinToEgesOf(view: UIView, insets: UIEdgeInsets = .zero) {
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom).isActive = true
    }
    
    func showBorder(color: UIColor = .red, width: CGFloat = 1.0) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
