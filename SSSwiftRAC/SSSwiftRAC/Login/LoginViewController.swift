//
//  LoginViewController.swift
//  SSSwiftRAC
//
//  Created by Liu Jie on 2018/12/16.
//  Copyright © 2018 JasonMark. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtAccount: UITextField!
    
    @IBOutlet weak var txtPwd: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let viewModel = LoginViewModel()
        viewModel.binding(account: txtAccount, password: txtPwd, loginButton: btnLogin)

    }
}
