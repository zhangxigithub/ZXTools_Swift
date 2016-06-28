//
//  ViewController.swift
//  demo
//
//  Created by 张玺 on 6/28/16.
//  Copyright © 2016 zhangxi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.label.fitWidth()
        self.label.fitHeight()
    }


}
