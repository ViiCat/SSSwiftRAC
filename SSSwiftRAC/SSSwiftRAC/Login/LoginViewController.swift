//
//  LoginViewController.swift
//  SSSwiftRAC
//
//  Created by Liu Jie on 2018/12/16.
//  Copyright © 2018 JasonMark. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result



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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
