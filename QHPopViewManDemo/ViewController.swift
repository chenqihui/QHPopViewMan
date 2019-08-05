//
//  ViewController.swift
//  QHPopViewMan
//
//  Created by Anakin chen on 2019/8/4.
//  Copyright © 2019 Chen Network Technology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func codeAction(_ sender: Any) {
        let _ = CodePopView.create(superV: self.view)
    }
    
    @IBAction func xibAction(_ sender: Any) {
        let _ = XibPopView.create(superV: self.view)
    }
    
    @IBAction func masonryAction(_ sender: Any) {
        let _ = MasonryPopView.create(superV: self.view)
    }
    
}

