//
//  ViewController.swift
//  TdwCircleViewDemo
//
//  Created by 谭迪文 on 2021/5/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tdwCircleV: TdwCircleView!
    let tdwCircleV2 = TdwCircleView()
    
    let vc1 = VC1()
    let vc2 = VC2()
    let vc3 = VC3()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //添加3个纯代码的简单视图
        //add 3 view by coding
        //MARK: - v1
        let v1 = UIView()
        v1.backgroundColor = UIColor.red
        let label1 = UILabel()
        label1.text = "1"
        label1.frame = CGRect(x: 10, y: 10, width: 100, height: 30)
        label1.backgroundColor = UIColor.white
        v1.addSubview(label1)
        
        
        //MARK: - v2
        let v2 = UIView()
        v2.backgroundColor = UIColor.yellow
        let label2 = UILabel()
        label2.text = "2"
        label2.frame = CGRect(x: 10, y: 10, width: 100, height: 30)
        label2.backgroundColor = UIColor.white
        v2.addSubview(label2)
        let sw2 = UISwitch()
        v2.addSubview(sw2)
        sw2.frame = CGRect(x: 30, y: 50, width: 10, height: 10)
        
        
        let v3 = UIView()
        v3.backgroundColor = UIColor.blue
        let sw3 = UISwitch()
        v3.addSubview(sw3)
        sw3.frame = CGRect(x: 40, y: 70, width: 10, height: 10)
        let label3 = UILabel()
        label3.text = "3"
        label3.frame = CGRect(x: 10, y: 10, width: 100, height: 30)
        label3.backgroundColor = UIColor.white
        v3.addSubview(label3)
        
        
        //添加3个控制器的视图,为了让控制器不释放,把控制器设置成了成员变量 ,至少添加3个控制器或者视图,2个的话,UICollectView重用的时候加载view会提前消失
        //add 3 view of UIViewControllor,In order not to release UIViewContrllor,We set the Contrllor to member variable.
        tdwCircleV.views = [vc1.view,vc2.view,vc3.view] //视图数组 Views array
        tdwCircleV.isVertical = false //是否是垂直滚动 is vertical scrolling
        tdwCircleV.autoScroll = true    //是否自动滚动 is can scroll
        tdwCircleV.pageControl.isHidden = false //是否显示页面 , page is hidden
        tdwCircleV.timeInterval = 2 //时间间隔 time interval
        tdwCircleV.didSelect { index in  //点击回调  , click block
            print("水平视图选中了\(index)行")
        }
        tdwCircleV.titles = ["第一个","第二个","第三个"] //标题 title

        
        
        
        
        //添加3个纯代码的 UIView,
        //add 3 view only by coding without Contrllor or xib
        view.addSubview(tdwCircleV2)
        tdwCircleV2.views = [v1,v2,v3]
        tdwCircleV2.isVertical = true
        tdwCircleV2.autoScroll = true
        tdwCircleV2.timeInterval = 1.5
        tdwCircleV2.didSelect { index in
            print("垂直视图选中了\(index)列")
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tdwCircleV2.frame = CGRect(x: 20, y: 400, width: view.bounds.width - 40, height: 300)
    }
}

