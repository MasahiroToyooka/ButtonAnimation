//
//  ViewController.swift
//  ButtonAnimation
//
//  Created by 豊岡正紘 on 2019/05/24.
//  Copyright © 2019 Masahiro Toyooka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let alertLabel: UILabel = {
        let label = UILabel()
        label.text = "　∧_∧　ババババ\n（ ・ω・)=つ≡つ\n（っ ≡つ=つ\n`/　　)\n(ノΠＵ\n何回閉じても無駄ですよ～ww\nm9（＾Д＾）プギャー！！"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let registerButton: UIButton = {
        let bn = UIButton(type: .system)
        bn.setTitle("閉じる", for: .normal)
        bn.setTitleColor(.black, for: .normal)
        bn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        bn.backgroundColor = .yellow
        bn.layer.cornerRadius = 16
//        bn.clipsToBounds = true
//        bn.layer.shadowOffset = CGSize(width: 0, height: 10)
//        bn.layer.shadowOpacity = 0.1
//        bn.layer.shadowRadius = 10
//        bn.layer.shouldRasterize = true
        bn.addTarget(self, action: #selector(bounce), for: .touchUpInside)
        bn.translatesAutoresizingMaskIntoConstraints = false
        return bn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(alertLabel)
        view.addSubview(registerButton)

        NSLayoutConstraint.activate([
            
            alertLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            alertLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            alertLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100),
            
            
            
            registerButton.widthAnchor.constraint(equalToConstant: 200),
            registerButton.heightAnchor.constraint(equalToConstant: 60),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80)
        ])
    }

    @objc func bounce() {
        
        let buttonBounce = registerButton.frame
        let labelBounce = alertLabel.frame
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
            
            self.registerButton.bounds = CGRect(x: buttonBounce.origin.x - 30, y: buttonBounce.origin.y, width: buttonBounce.size.width + 60, height: buttonBounce.size.height)
            
            self.alertLabel.bounds = CGRect(x: labelBounce.origin.x - 30, y: labelBounce.origin.y, width: labelBounce.size.width + 60, height: labelBounce.size.height)
        }) { (success: Bool) in
            if success {
                UIView.animate(withDuration: 0.5, animations: {
                    self.registerButton.bounds = buttonBounce
                })
                UIView.animate(withDuration: 0.5, animations: {
                    self.alertLabel.bounds = labelBounce
                })
            }
        }
    }
}

