//
//  AViewController.swift
//  Class02
//
//  Created by njcit-06 on 2019/7/9.
//  Copyright © 2019 edu.njcit. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
  @IBOutlet weak var lbXLMsg: UITextField!



    @IBOutlet weak var btnHiBottonConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification , object:nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillHideNotification , object:nil)
    }
    
    @IBAction func btnAClicked(_ sender: UIButton) {
        
        print("我按了啥？")
        
        lbXLMsg.text = "我要吃铜锣烧"
        lbXLMsg.textColor = UIColor.red
        
        
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let keyboardHeight = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        print("猜猜看： \(keyboardHeight)")
        
        btnHiBottonConstraint.constant = keyboardHeight
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

   
    
    
//    @objc func keyboardWillHide(notification: NSNotification) {
//        let keyboardHeight = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
//        print(keyboardHeight)
//    }

}
