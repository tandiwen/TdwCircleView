//
//  UIView+Extension.swift
//  dragonWingAdvanceSale
//
//  Created by tdw on 2019/12/2.
//  Copyright © 2019 tdw. All rights reserved.
//


import UIKit
import Foundation


extension UIView {
    typealias CALLBACK = (String)->()
    public struct RuntimeKey {
        static let UIViewKey = UnsafeRawPointer.init(bitPattern: "UIViewKey".hashValue)
        /// ...其他Key声明
    }
    /// 运行时关联
    @objc public var tdwView: TDWView {
        set {
            objc_setAssociatedObject(self, UIView.RuntimeKey.UIViewKey!, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            var obj = objc_getAssociatedObject(self, UIView.RuntimeKey.UIViewKey!) as? TDWView
            if obj == nil {
                obj = TDWView.init(view: self)
                objc_setAssociatedObject(self, UIView.RuntimeKey.UIViewKey!, obj, .OBJC_ASSOCIATION_RETAIN)
            }
            return obj!
        }
    }
    
}

@objc
public class TDWView:NSObject {
    
    @objc public enum GesType:Int {
        case Tap //轻点手势
        case Pinch //捏合手势
        case Rotation//旋转手势
        case Swipe //轻扫手势
        case Pan//滑动手势
    }
    public typealias CALLBACKVoid = ()->Void
    public typealias CALLBACKGES = (_ gester: UIPanGestureRecognizer)->Void
    var callBackGes: CALLBACKGES = { _ in }
    var callBackVoid: CALLBACKVoid = { }
    var view:UIView
    
    
    init(view:UIView ) {
        self.view = view
    }
    
    @objc public func  tap(_ callBackVoid: @escaping CALLBACKVoid){
        addGesture(.Tap, callBackVoid: callBackVoid)
    }
    /**
     添加手势,target中不传入gester手势参数
     
     @param gesType 手势类型
     @param callBack 传入闭包,不带入参
     */
    @objc public func  addGesture(_ gesType:GesType, callBackVoid: @escaping CALLBACKVoid){
        self.callBackVoid = callBackVoid
        view.isUserInteractionEnabled = true
        var ges:UIGestureRecognizer?
        
        switch gesType {
        case .Tap:
            ges =  UITapGestureRecognizer(target: self, action: #selector(GesFnVoid))
        case .Pinch:
            ges =  UIPinchGestureRecognizer(target: self, action: #selector(GesFnVoid))
        case .Pan:
            ges =  UIPanGestureRecognizer(target: self, action: #selector(GesFnVoid))
        case .Rotation:
            ges = UIRotationGestureRecognizer(target: self, action: #selector(GesFnVoid))
        case .Swipe:
            ges = UISwipeGestureRecognizer(target: self, action: #selector(GesFnVoid))
        default:
            print("没有实现的手势类型")
        }
        view.addGestureRecognizer(ges!)
    }
    /**
     添加手势,target中带传入gester手势参数
     
     @param gesType 手势类型
     @param callBack 传入闭包,带入参
     */
    @objc public func  addGesture(_ gesType:GesType, callBackGes: @escaping CALLBACKGES){

        self.callBackGes = callBackGes
        view.isUserInteractionEnabled = true
        var ges:UIGestureRecognizer?
        
        switch gesType {
        case .Pinch:
            ges =  UIPinchGestureRecognizer(target: self, action: #selector(GesFnGes(gester:)))
        case .Tap:
            ges =  UITapGestureRecognizer(target: self, action: #selector(GesFnGes(gester:)))
            
        case .Pan:
            ges =  UIPanGestureRecognizer(target: self, action: #selector(GesFnGes(gester:)))
        case .Rotation:
            ges = UIRotationGestureRecognizer(target: self, action: #selector(GesFnGes(gester:)))
        case .Swipe:
            ges = UISwipeGestureRecognizer(target: self, action: #selector(GesFnGes(gester:)))
        default:
            print("没有实现的手势类型")
        }
        view.addGestureRecognizer(ges!)
    }
    @objc private func GesFnVoid(){
        callBackVoid()
    }
    
    @objc private func GesFnGes(gester: UIPanGestureRecognizer){
        callBackGes(gester)
    }
    
    deinit {
        print("TDWView deinit")
    }
}
