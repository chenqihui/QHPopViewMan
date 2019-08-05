 //
//  QHPopViewMan.swift
//  QHPopViewMan
//
//  Created by Anakin chen on 2019/8/4.
//  Copyright © 2019 Chen Network Technology. All rights reserved.
//

import UIKit
 
/*
  create 不同的对象，针对不同的 UI 构建
  
  frame: QHFramePopViewMan
  autolayout: QHAutoLayoutPopViewMan
  masonry: QHMasonryPopViewMan
  
  // API
  initHide: 初始隐藏
  popUp: 展示
  popDown: 隐藏
*/

public class QHPopViewMan: NSObject {
    
    weak var popV: UIView!

    public var isShow = false
    
    public var durationTime: TimeInterval = 1.5
    
    // 子类实现
    func hide() {}
    func show() {}
}
 
extension QHPopViewMan {
    public class func create(popView v: UIView) -> QHPopViewMan {
        let m = QHPopViewMan()
        m.popV = v
        return m
    }
    
    public func initHide(block a: (() -> Void)? = nil) {
        if let aa = a {
            aa()
        }
        else {
            hide()
        }
    }
}
 
extension QHPopViewMan {
    public func popUp(animations: (() -> Void)? = nil, _ completion: ((Bool) -> Void)? = nil) {
        self.isShow = true
        UIView.animate(withDuration: durationTime, animations: {
            if let a = animations {
                a()
            }
            else {
                self.show()
            }
        }) { (bFinish) in
            completion?(bFinish)
        }
    }
    
    public func popDown(animations: (() -> Void)? = nil, _ completion: ((Bool) -> Void)? = nil) {
        self.isShow = false
        UIView.animate(withDuration: durationTime, animations: {
            if let a = animations {
                a()
            }
            else {
                self.hide()
            }
        }) { (bFinish) in
            completion?(bFinish)
        }
    }
}
 
public class QHFramePopViewMan: QHPopViewMan {
    private var sFrame = CGRect.zero
    private var hFrame = CGRect.zero

    public class func create(popView v: UIView, showFrame sF: CGRect, hideFrame hF: CGRect) -> QHFramePopViewMan {
        let m = QHFramePopViewMan()
        m.popV = v
        m.sFrame = sF
        m.hFrame = hF
        return m
    }

    override func hide() {
        popV.frame = hFrame
    }

    override func show() {
        popV.frame = sFrame
    }
}

public class QHAutoLayoutPopViewMan: QHPopViewMan {
    private weak var lc: NSLayoutConstraint?
    
    private var sConstant: CGFloat = 0
    private var hConstant: CGFloat = 0

    public class func create(popView v: UIView, layoutConstraint lc: NSLayoutConstraint, showConstant sC: CGFloat, hideConstant hC: CGFloat) -> QHAutoLayoutPopViewMan {
        let m = QHAutoLayoutPopViewMan()
        m.popV = v
        m.lc = lc
        m.sConstant = sC
        m.hConstant = hC
        return m
    }

    override func hide() {
        lc!.constant = hConstant
        popV.superview?.layoutIfNeeded()
    }

    override func show() {
        lc!.constant = sConstant
        popV.superview?.layoutIfNeeded()
    }
}
