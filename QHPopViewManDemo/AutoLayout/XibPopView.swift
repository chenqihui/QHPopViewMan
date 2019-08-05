//
//  XibPopView.swift
//  QHPopViewMan
//
//  Created by Anakin chen on 2019/8/4.
//  Copyright © 2019 Chen Network Technology. All rights reserved.
//

import UIKit

import QHModules

class XibPopView: UIView {
    
    @IBOutlet weak var popVBottomLC: NSLayoutConstraint!
    @IBOutlet weak var popV: UIView!
    
    private var popMan: QHPopViewMan!
    
    @IBAction func tapCloseAction(_ sender: Any) {
        if popMan.isShow {
            popMan.popDown { (bF) in
                self.removeFromSuperview()
            }
        }
    }
}

extension XibPopView {
    public class func create(superV: UIView) -> XibPopView? {
        if let view = Bundle.main.loadNibNamed("XibPopView", owner: nil, options: nil)?.first as? XibPopView {
            QHViewUtil.fullView(view, to: superV)
            view.p_setup()
            return view
        }
        return nil
    }
}

extension XibPopView {
    private func p_setup() {
        p_addPopViewMan()
    }
    
    // 调用
    private func p_addPopViewMan() {
        let sC: CGFloat = 0
        let hC = -UIScreen.main.bounds.size.height/2
        popMan = QHAutoLayoutPopViewMan.create(popView: popV, layoutConstraint: popVBottomLC, showConstant: sC, hideConstant: hC)
        popMan.durationTime = 0.6
        popMan.initHide()
        popMan.popUp()
    }
}
