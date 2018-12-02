//
//  xieyiViewController.swift
//  模仿小说
//
//  Created by 姚智豪 on 2018/11/22.
//  Copyright © 2018年 YZH. All rights reserved.
//

import UIKit

class xieyiViewController: UIViewController {
    
    lazy var textview : UITextView = {
      let textview = UITextView()
        let path = Bundle.main.path(forResource: "xieyi.plist", ofType: nil)
        var message = NSDictionary.init(contentsOfFile: path!)?["协议"] as! String
        textview.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        textview.text = message
        return textview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "版权归属"
        self.view.backgroundColor = UIColor.white
        view.addSubview(textview)
    }
}
