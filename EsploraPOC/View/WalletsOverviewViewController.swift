//
//  WalletsOverviewViewController.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import UIKit

class WalletsOverviewViewController: BaseViewController {
    private let viewModel: WalletsOverviewViewModel
    
    var balanceLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        return cv
    }()
    
    init(viewModel: WalletsOverviewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    override func setupTheme() {
        // navigation
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: AppStyle.Color.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        // ui elements
        view.backgroundColor = AppStyle.Color.primary
        collectionView.backgroundColor = AppStyle.Color.primary
        balanceLabel.textColor = AppStyle.Color.white
        balanceLabel.font = AppStyle.Font.mTitle
    }
    
    override func setupView() {
        view.backgroundColor = .white
        title = "My Wallets"

        view.addSubview(balanceLabel)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WalletViewCell.self, forCellWithReuseIdentifier: WalletViewCell.identifier)
        // collection view layout
        let layout = UICollectionViewFlowLayout()
        let width = view.bounds.width - 20
        layout.itemSize = CGSize(width: view.bounds.width - 20, height: width * 1/2)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    override func setupConstraints() {
        balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
        balanceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        balanceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).activate()
        
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        collectionView.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 20).activate()
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).activate()
    }
    
    private func loadData() {
        viewModel.loadWallets { _ in
            DispatchQueue.main.async {
                print("done loading wallet")
                self.collectionView.reloadData()
                self.balanceLabel.text = self.viewModel.balanceTitle
            }
        }
    }
}

extension WalletsOverviewViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.wallets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalletViewCell.identifier, for: indexPath) as! WalletViewCell
        let cellVM = viewModel.viewModelForCellAt(indexPath: indexPath)
        cell.configure(viewModel: cellVM)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TransactionsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

