//
//  BaseViewController.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 29/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, ViewSetupable {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraints()
        setupTheme()
    }

    func setupView() {
    }
    func setupConstraints() {
    }
    func setupTheme() {
    }
}
