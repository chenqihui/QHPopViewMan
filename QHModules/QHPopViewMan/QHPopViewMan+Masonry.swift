//
//  QHPopViewMan+Masonry.swift
//  QHPopViewMan
//
//  Created by Anakin chen on 2019/8/5.
//  Copyright © 2019 Chen Network Technology. All rights reserved.
//

import Masonry

public class QHMasonryPopViewMan: QHPopViewMan {
    weak var masConstraint: MASConstraint!
    
    var sOffset: CGFloat = 0
    var hOffset: CGFloat = 0
    
    public class func create(popView v: UIView, constraint c: MASConstraint, showOffset sO: CGFloat, hideOffset hO: CGFloat) -> QHMasonryPopViewMan {
        let m = QHMasonryPopViewMan()
        m.popV = v
        m.sOffset = sO
        m.hOffset = hO
        m.masConstraint = c
        
        return m
    }
    
    override func hide() {
        masConstraint.setOffset(hOffset)
        popV.superview?.layoutIfNeeded()
    }
    
    override func show() {
        masConstraint.setOffset(sOffset)
        popV.superview?.layoutIfNeeded()
    }
}
