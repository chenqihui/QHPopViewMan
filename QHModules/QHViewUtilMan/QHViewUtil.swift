//
//  QHViewUtil.swift
//  QHPopViewMan
//
//  Created by Anakin chen on 2019/8/4.
//  Copyright © 2019 Chen Network Technology. All rights reserved.
//

import UIKit

public class QHViewUtil: NSObject {
    public class func fullView(_ view: UIView, to superV: UIView) {
        superV.addSubview(view)
        let viewsDict = ["view": view]
        view.translatesAutoresizingMaskIntoConstraints = false
        superV.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-0-[view]-0-|", options: .alignAllLastBaseline, metrics: nil, views: viewsDict))
        superV.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: .alignAllLastBaseline, metrics: nil, views: viewsDict))
    }
}
