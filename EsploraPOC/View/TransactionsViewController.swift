//
//  TransactionsViewController.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 29/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import UIKit

struct TransactionsViewViewModel {
    var transactions: [Transaction] = Transaction.mockTransactions()
}

class TransactionsViewController: BaseViewController {
    var transactions: [Transaction] = Transaction.mockTransactions()
    private var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: "cellid")
    }
    
    override func setupConstraints() {
        tableView.pinToEgesOf(view: view)
    }
    
    override func setupTheme() {
        view.backgroundColor = AppStyle.Color.primary
        tableView.backgroundColor = .clear
    }
}

extension TransactionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as! TransactionTableViewCell
        // temp
        let cellViewModel = TransactionTableViewCellViewModel(transaction: transactions[indexPath.row])
        cell.configure(viewModel: cellViewModel)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
