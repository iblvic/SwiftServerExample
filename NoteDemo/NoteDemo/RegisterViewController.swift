//
//  RegisterViewController.swift
//  NoteDemo
//
//  Created by Hao's iMac on 2019/6/14.
//  Copyright © 2019 Hao's iMac. All rights reserved.
//

import UIKit


class RegisterViewController: UIViewController {
    
    
    lazy var userNameTF: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.red
        textField.placeholder = "用户名"
        return textField
    }()
    lazy var userPasswordTF: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.red
        textField.placeholder = "密码"
        return textField
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.orange
        button.setTitle("注册", for: .normal)
        button.addTarget(self, action: #selector(registerButtonClick(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        view.addSubview(userNameTF)
        view.addSubview(userPasswordTF)
        view.addSubview(registerButton)
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let viewWidth = view.bounds.size.width
        userNameTF.frame = CGRect.init(x: 15, y: 100, width: viewWidth-30, height: 40)
        userPasswordTF.frame = CGRect.init(x: 15, y: userNameTF.frame.maxY+20, width: viewWidth-30, height: 40)
        registerButton.frame = CGRect.init(x: 15, y: userPasswordTF.frame.maxY+40, width: viewWidth-30, height: 40)
    }
    
    @objc func registerButtonClick(_ button: UIButton) -> Void {
        print("\(button.description)")
    }
}
