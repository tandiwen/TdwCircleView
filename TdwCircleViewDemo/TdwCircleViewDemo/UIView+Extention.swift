//
//  UIView+Extention.swift
//  TdwCircleViewDemo
//
//  Created by 谭迪文 on 2021/5/21.
//

import UIKit
extension UIView
{
    /**
     
     完全复制一个UIView给另外一个对象,再返回
     @param T 传入的UIView
     */
    func copyView<T: UIView>() -> T {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T
    }
}
