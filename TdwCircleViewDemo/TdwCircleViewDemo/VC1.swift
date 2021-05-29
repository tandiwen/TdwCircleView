//
//  VC1.swift
//  TdwCircleViewDemo
//
//  Created by 谭迪文 on 2021/5/28.
//

import UIKit

class VC1: UIViewController {
    
    @IBOutlet weak var imageV: UIImageView!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imageV.tdwView.tap {
            [unowned self] in
            count += 1
            if count % 2 == 0{
                imageV.image = UIImage(named: "1")
            }else{
                imageV.image = UIImage(named: "2")
            }
        }
        
    }
    
    @IBAction func btn1Click(_ sender: Any) {
        print(Self.self,#function)
        view.backgroundColor = UIColor.init(displayP3Red: CGFloat.random(in: 0 ... 255)/255.0, green:  CGFloat.random(in: 0 ... 255)/255.0, blue:  CGFloat.random(in: 0 ... 255)/255.0, alpha: 1)
    }
    
}
