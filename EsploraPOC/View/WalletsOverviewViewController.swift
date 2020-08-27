//
//  WalletsOverviewViewController.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import UIKit

class WalletsOverviewViewController: UIViewController {
    private let viewModel: WalletsOverviewViewModel
    
    init(viewModel: WalletsOverviewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraints()
        
        viewModel.loadWallets { _ in
            print("done")
        }
    }

    private func setupView() {
        view.backgroundColor = .red
        title = "Esplora Wallets"

    }
    
    private func setupConstraints() {
        
    }
}

