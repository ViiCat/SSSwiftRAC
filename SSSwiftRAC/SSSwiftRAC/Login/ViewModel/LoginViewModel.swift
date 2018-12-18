//
//  LoginViewModel.swift
//  SSSwiftRAC
//
//  Created by Liu Jie on 2018/12/16.
//  Copyright © 2018 JasonMark. All rights reserved.
//

import UIKit
import Foundation
import ReactiveSwift
import ReactiveCocoa
import Result

class LoginViewModel: NSObject {
    
    func binding(account: UITextField, password: UITextField, loginButton: UIButton) {
        
        // 信号
        let accountSignal  = account.reactive.continuousTextValues
        let passwordSignal = password.reactive.continuousTextValues
        
        
        // 用户名输入信号
        let accountMapSignal = accountSignal.map({ (value) -> Bool in
            
            // 字符串大于11位数 截取前11位
            if ((value!.characters.count) > 11) {
                
                let startIdx = value?.index((value!.startIndex), offsetBy: 0)
                let endIdx = value?.index(startIdx!, offsetBy:11)
                let result = value!.substring(with: startIdx!..<endIdx!)
                
                account.text = result
            }
            
            // 返回信号的值
            return  account.text!.characters.count == 11 ? true : false
        })
        
        
        // 密码输入信号
        let passwordMapSignal = passwordSignal.map({ (value) -> Bool in
            // 返回信号的值
            return value!.characters.count > 5 ? true : false
        })
        
        
        // 合并信号
        let bgColorSignl = Signal.combineLatest(accountMapSignal, passwordMapSignal).map { (arg) -> UIColor in
            
            let (value1, value2) = arg
            return value1 && value2 ? .red : .lightGray
        }
        
        let bgColor = Property(initial: .lightGray, then: bgColorSignl)
        
        // 绑定
        loginButton.reactive.backgroundColor <~ bgColor
        
    }
}
