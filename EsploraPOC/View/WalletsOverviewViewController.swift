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
    
    var balanceLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
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

        setupView()
        setupConstraints()
        theme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
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

extension WalletsOverviewViewController: ViewSetupable {
    func theme() {
        // navigation
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: AppStyle.Color.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        // ui elements
        view.backgroundColor = AppStyle.Color.primary
        collectionView.backgroundColor = AppStyle.Color.primary
        balanceLabel.textColor = AppStyle.Color.white
        balanceLabel.font = AppStyle.Font.largeTitle
    }
    
    func setupView() {
        view.backgroundColor = .white
        title = "Esplora Wallets"

        view.addSubview(balanceLabel)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WalletViewCell.self, forCellWithReuseIdentifier: WalletViewCell.identifier)
        // collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width - 20, height: 70)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    func setupConstraints() {
        balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        balanceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        balanceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
        let vc = UIViewController()
        vc.view.backgroundColor = .yellow
        navigationController?.pushViewController(vc, animated: true)
    }
}

