//
//  TNSNotificationBar+UIView.swift
//  TNSNotificationBar
//
//  Created by 棚瀨 隆太 on 2018/02/15.
//  Copyright © 2018年 棚瀨 隆太. All rights reserved.
//

import UIKit

public extension UIView {

    func makeNotificationBar() {
        let notificationBar: TNSNotificationBar = {
            let view = TNSNotificationBar(frame: CGRect(x: 0, y: -70, width: frame.width * 0.9, height: 70))
            view.center.x = self.center.x
            view.layer.masksToBounds = true
            view.layer.cornerRadius = 10.0
            return view
        }()
        addSubview(notificationBar)
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            notificationBar.frame.origin.y = 20
        })
    }

}
