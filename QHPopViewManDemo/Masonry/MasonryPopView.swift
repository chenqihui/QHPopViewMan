//
//  MasonryPopView.swift
//  QHPopViewMan
//
//  Created by Anakin chen on 2019/8/5.
//  Copyright © 2019 Chen Network Technology. All rights reserved.
//

import UIKit

import Masonry
import QHModules

class MasonryPopView: UIView {
    private var popV: UIView!
    
    private var popMan: QHMasonryPopViewMan!
    private var bottomConstraint: MASConstraint!
    
    @objc func tapCloseAction(_ sender: Any) {
        if popMan.isShow {
            popMan.popDown { (bF) in
                self.removeFromSuperview()
            }
        }
    }
}

extension MasonryPopView {
    public class func create(superV: UIView) -> MasonryPopView {
        let view = MasonryPopView()
        QHViewUtil.fullView(view, to: superV)
        view.p_setup()
        return view
    }
}

extension MasonryPopView {
    private func p_setup() {
        p_setupUI()
        p_addPopViewMan()
    }
    
    private func p_setupUI() {
        let bgV = UIView()
        bgV.backgroundColor = UIColor(white: 0, alpha: 0.3)
        QHViewUtil.fullView(bgV, to: self)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(MasonryPopView.tapCloseAction(_:)))
        bgV.addGestureRecognizer(tap)
        
        popV = UIView()
        popV.backgroundColor = UIColor.blue
        addSubview(popV)
        popV.mas_makeConstraints { (make) in
            make?.leading.trailing()?.equalTo()(self)?.setOffset(0)
            self.bottomConstraint = make?.bottom.equalTo()(self.mas_bottom)
            make?.height.equalTo()(self.mas_height)?.multipliedBy()(0.5)
        }
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Welcome to Masonry's space"
        QHViewUtil.fullView(label, to: popV)
    }
    
    // 调用
    private func p_addPopViewMan() {
        let h: CGFloat = UIScreen.main.bounds.size.height/2
        popMan = QHMasonryPopViewMan.create(popView: popV, constraint: bottomConstraint, showOffset: 0, hideOffset: h)
        popMan.durationTime = 0.6
        popMan.initHide()
        popMan.popUp()
    }
}
