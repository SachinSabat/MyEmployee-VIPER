//
//  ApplicationX+WindowX.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 11/02/21.
//

import UIKit

extension UIApplication {
    var statusView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 38482
            if let statusBar = UIWindow.key?.viewWithTag(tag) {
                return statusBar
            } else {
                let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
                statusBarView.tag = tag

                UIWindow.key?.addSubview(statusBarView)
                return statusBarView
            }
        } else {
            if responds(to: Selector(("statusBar"))) {
                return value(forKey: "statusBar") as? UIView
            }
        }
        return nil
    }
}

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
