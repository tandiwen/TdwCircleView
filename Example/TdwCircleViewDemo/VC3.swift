//
//  VC3.swift
//  TdwCircleViewDemo
//
//  Created by 谭迪文 on 2021/5/29.
//

import UIKit

class VC3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func btn1Click(_ sender: Any) {
        print(Self.self,#function)
        view.backgroundColor = UIColor.init(displayP3Red: CGFloat.random(in: 0 ... 255)/255.0, green:  CGFloat.random(in: 0 ... 255)/255.0, blue:  CGFloat.random(in: 0 ... 255)/255.0, alpha: 1)
    }


}
