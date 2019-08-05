//
//  CodePopView.swift
//  QHPopViewMan
//
//  Created by Anakin chen on 2019/8/4.
//  Copyright © 2019 Chen Network Technology. All rights reserved.
//

import UIKit

import QHModules

class CodePopView: UIView {
    private var popV: UIView!
    
    private var popMan: QHPopViewMan!
    
    @objc func tapCloseAction(_ sender: Any) {
        if popMan.isShow {
            popMan.popDown { (bF) in
                self.removeFromSuperview()
            }
        }
    }
}

extension CodePopView {
    public class func create(superV: UIView) -> CodePopView {
        let view = CodePopView()
        QHViewUtil.fullView(view, to: superV)
        view.p_setup()
        return view
    }
}

extension CodePopView {
    private func p_setup() {
        p_setupUI()
        p_addPopViewMan()
    }
    
    private func p_setupUI() {
        let bgV = UIView()
        bgV.backgroundColor = UIColor(white: 0, alpha: 0.3)
        QHViewUtil.fullView(bgV, to: self)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CodePopView.tapCloseAction(_:)))
        bgV.addGestureRecognizer(tap)
        
        let w = UIScreen.main.bounds.size.width
        let h: CGFloat = UIScreen.main.bounds.size.height/2
        let y = UIScreen.main.bounds.size.height - h
        let rect = CGRect(x: 0, y: y, width: w, height: h)
        popV = UIView(frame: rect)
        popV.backgroundColor = UIColor.orange
        addSubview(popV)
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Welcome to code's space"
        QHViewUtil.fullView(label, to: popV)
    }
    
    // 调用
    private func p_addPopViewMan() {
        let rect = popV.frame
        let sF = rect
        let hF = CGRect(origin: CGPoint(x: rect.origin.x, y: rect.maxY), size: rect.size)
        popMan = QHFramePopViewMan.create(popView: popV, showFrame: sF, hideFrame: hF)
        popMan.durationTime = 0.6
        popMan.initHide()
        popMan.popUp()
    }
}
