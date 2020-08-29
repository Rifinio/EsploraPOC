//
//  TransactionTableViewCell.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 29/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import UIKit

struct TransactionTableViewCellViewModel {
    var fromAddress: String
    var toAddress: String
    var confirmed: Bool
}

extension TransactionTableViewCellViewModel {
    init(transaction: Transaction) {
        fromAddress = transaction.fromAdress
        toAddress = transaction.toAdress
        confirmed = transaction.isConfirmed
    }
}

class TransactionTableViewCell: UITableViewCell {
    
    var signImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    var fromAddressLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        return l
    }()
    var toAddressLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        return l
    }()
    var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 10
        sv.alignment = .center
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    var statusView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
        setupTheme()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TransactionTableViewCell {
    func configure(viewModel: TransactionTableViewCellViewModel) {
        fromAddressLabel.text = viewModel.fromAddress
        toAddressLabel.text = viewModel.toAddress
        statusView.backgroundColor = viewModel.confirmed ? .green : .orange
    }
}

extension TransactionTableViewCell: ViewSetupable {
    func setupView() {
        contentView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(signImageView)
        mainStackView.addArrangedSubview(setupfromToStack())
        mainStackView.addArrangedSubview(statusView)
        
        signImageView.image = UIImage(named: "icon-btc")
    }
    
    private func setupfromToStack() -> UIStackView {
        let sv = UIStackView()
        sv.axis = .vertical
        let fromLabel = UILabel()
        fromLabel.font = AppStyle.Font.xsTitle
        fromLabel.textColor = AppStyle.Color.white
        let toLabel = UILabel()
        toLabel.font = AppStyle.Font.xsTitle
        toLabel.textColor = AppStyle.Color.white
        
        sv.addArrangedSubview(fromLabel)
        sv.addArrangedSubview(fromAddressLabel)
        sv.addArrangedSubview(toLabel)
        sv.addArrangedSubview(toAddressLabel)
        
        fromLabel.text = "from:"
        toLabel.text = "to:"
        fromAddressLabel.text = "lkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkjlkj"
        toAddressLabel.text = "lkjlkjlkj"

        return sv
    }
    
    func setupConstraints() {
        mainStackView.pinToEgesOf(view: contentView, insets: UIEdgeInsets(top: 5, left: 10, bottom: -5, right: -10))
        signImageView.layoutWith(size: CGSize(width: 30, height: 30))
        statusView.layoutWith(size: CGSize(width: 30, height: 30))
    }
    
    func setupTheme() {
        contentView.backgroundColor = AppStyle.Color.primary
        mainStackView.backgroundColor = .clear
        fromAddressLabel.font = AppStyle.Font.sTitle
        fromAddressLabel.textColor = AppStyle.Color.accent
        toAddressLabel.font = AppStyle.Font.sTitle
        toAddressLabel.textColor = AppStyle.Color.accent
        
        statusView.backgroundColor = .green
    }
}
