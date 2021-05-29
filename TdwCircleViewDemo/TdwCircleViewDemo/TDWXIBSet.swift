//
//  TDWXIBSet.swift
//  XibInXibDemo
//
//  Created by tdw on 2021/2/12.
//  Copyright © 2021 谭迪文. All rights reserved.
import UIKit
import Foundation
protocol TDWXIBSet where Self:UIView {
}

extension TDWXIBSet {
    func setXib(){
        // 需要这句代码，不能直接写UINib(nibName: "MyView", bundle: nil)，不然不能在storyboard中显示
        let bundle = Bundle(for: type(of: self))
        let className = "\(Self.self)"
        let nib = UINib(nibName: className, bundle: bundle)
        let view = (nib.instantiate(withOwner: self, options: nil)[0] as! UIView)
        view.frame = bounds
        self.addSubview(view)
    }
}

