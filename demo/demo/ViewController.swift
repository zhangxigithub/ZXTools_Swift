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
    
    var index = 1
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        ZXLocationManager.shared.easyLocate(locate: { location in
            print("\(type(of: self))-location: \(self.index)")
        }, reverse: { mark in
            print("\(type(of: self))-reverse: \(self.index)")
            self.index += 1
        })
    }
}
