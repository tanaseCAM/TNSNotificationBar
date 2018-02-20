//
//  TNSNotificationBar.swift
//  TNSNotificationBar
//
//  Created by 棚瀨 隆太 on 2018/02/14.
//  Copyright © 2018年 棚瀨 隆太. All rights reserved.
//

import UIKit

private enum TNSNotificationBarState {
    case stretched
    case shrinked
}

public class TNSNotificationBar: UIView {
    
    fileprivate let defaultBarHeight: CGFloat = 70
    fileprivate let defaultBarPointY: CGFloat = 20
    fileprivate var initialPointY: CGFloat = 0
    fileprivate var currentState: TNSNotificationBarState = .shrinked
    fileprivate var isAnimating = false
    fileprivate var shouldCancelTouchEvents = false

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
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        addSubview(headerView)
        addSubview(bodyView)
        NSLayoutConstraint.activate ([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 70),
            
            bodyView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            bodyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bodyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bodyView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func stretch() {
        isAnimating = true
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, animations: {
            self.frame.origin.y = self.defaultBarPointY
            self.frame.size.height = 300
        }) { _ in
            self.isAnimating = false
            self.currentState = .stretched
        }
    }
    
    private func shrink() {
        isAnimating = true
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, animations: {
            self.frame.origin.y = self.defaultBarPointY
            self.frame.size.height = self.defaultBarHeight
        }) { _ in
            self.isAnimating = false
            self.currentState = .shrinked
        }
    }
    
    private func close() {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.frame.origin.y = -self.frame.size.height
        }) { _ in
            self.removeFromSuperview()
        }
    }
    
    private func returnInitialPosition() {
        isAnimating = true
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, animations: {
            self.frame.origin.y = self.defaultBarPointY
        }) { _ in
            self.isAnimating = false
        }
    }
    
}

extension TNSNotificationBar {
    
}

extension TNSNotificationBar {
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            print("Began:(\(location.x), \(location.y))")
            initialPointY = location.y
            shouldCancelTouchEvents = false
        }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            print("Moved:(\(location.x), \(location.y))")
            if isAnimating || shouldCancelTouchEvents {
                return
            }
            frame = CGRect(x: frame.origin.x,
                           y: frame.origin.y + (location.y - initialPointY),
                           width: frame.width,
                           height: frame.height)
            if frame.origin.y >= 100 {
                stretch()
                shouldCancelTouchEvents = true
            } else if frame.origin.y <= -30 {
                switch currentState {
                case .shrinked:
                    break
                case .stretched:
                    shrink()
                    shouldCancelTouchEvents = true
                }
            }
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            print("Ended:(\(location.x), \(location.y))")
            if isAnimating {
                return
            }
            if frame.origin.y <= -30 {
                switch currentState {
                case .shrinked:
                    close()
                case .stretched:
                    shrink()
                }
            } else {
                returnInitialPosition()
            }
        }
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            print("Ended:(\(location.x), \(location.y))")
            if isAnimating {
                return
            }
            if frame.origin.y <= -30 {
                switch currentState {
                case .shrinked:
                    close()
                case .stretched:
                    shrink()
                }
            } else {
                returnInitialPosition()
            }
        }
    }
}
