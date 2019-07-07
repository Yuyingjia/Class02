//
//  ViewController.swift
//  Class02
//
//  Created by njcit-06 on 2019/7/6.
//  Copyright © 2019 edu.njcit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var result : float_t = 10.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var ce : Int
        ce = 1
        let de = add(a: 1, b: 2)
        print(de)
        print("我一定学得会 Swift")
        
    }
    func add(a : Int, b : Int) -> Int {
        return a + b
    }

}

