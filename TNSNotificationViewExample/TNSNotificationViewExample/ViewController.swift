//
//  ViewController.swift
//  TNSNotificationViewExample
//
//  Created by 棚瀨 隆太 on 2018/02/14.
//  Copyright © 2018年 棚瀨 隆太. All rights reserved.
//

import UIKit
import TNSNotificationBar

class ViewController: UIViewController {
    
    let notificationBar: TNSNotificationBar = {
        let view = TNSNotificationBar(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(notificationBar)
        NSLayoutConstraint.activate ([
            notificationBar.topAnchor.constraint(equalTo: view.topAnchor),
            notificationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

