//
//  TNSNotificationBarElement.swift
//  TNSNotificationBar
//
//  Created by 棚瀨 隆太 on 2018/02/20.
//  Copyright © 2018年 棚瀨 隆太. All rights reserved.
//

import Foundation

public enum TNSNotificationBarButtonStyle {
    case normal
    case cancel
    case destructive
}

public protocol TNSNotificationBarElement {
}
public extension TNSNotificationBarElement where Self: TNSNotificationBarButton {
    func tappedtapped() {}
}

//extension NSObject: TNSNotificationBarElement {}
