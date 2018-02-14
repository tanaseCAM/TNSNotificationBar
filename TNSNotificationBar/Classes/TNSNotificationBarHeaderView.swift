//
//  TNSNotificationBarHeaderView.swift
//  TNSNotificationBar
//
//  Created by 棚瀨 隆太 on 2018/02/14.
//  Copyright © 2018年 棚瀨 隆太. All rights reserved.
//

import UIKit

class TNSNotificationBarHeaderView: UIView {
    
    private let containerView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fill
        view.spacing = 5.0
        view.backgroundColor = .clear
        return view
    }()
    
    private let messageAreaView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return view
    }()
    
    private let buttonAreaView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
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
        containerView.addArrangedSubview(messageAreaView)
        containerView.addArrangedSubview(buttonAreaView)
        addSubview(containerView)
        NSLayoutConstraint.activate ([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 50),
            
            messageAreaView.widthAnchor.constraint(equalToConstant: 200),
            messageAreaView.heightAnchor.constraint(equalToConstant: 40),
            buttonAreaView.widthAnchor.constraint(equalToConstant: 60),
            buttonAreaView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}

