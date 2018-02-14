//
//  TNSNotificationBar.swift
//  TNSNotificationBar
//
//  Created by 棚瀨 隆太 on 2018/02/14.
//  Copyright © 2018年 棚瀨 隆太. All rights reserved.
//

import UIKit

public class TNSNotificationBar: UIView {

    // MARK: Properties
    var headerView: TNSNotificationBarHeaderView = {
        let view = TNSNotificationBarHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var bodyView: TNSNotificationBarBodyView = {
        let view = TNSNotificationBarBodyView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        addSubview(headerView)
        addSubview(bodyView)
        NSLayoutConstraint.activate ([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            
            bodyView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            bodyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bodyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bodyView.heightAnchor.constraint(equalToConstant: 0)
        ])
    }
    
}
