//
//  TdwCircleViewCell.swift
//  TdwCircleViewDemo
//
//  Created by 谭迪文 on 2021/5/25.
//

import UIKit
//import SnapKit
class TdwCircleViewCell: UICollectionViewCell {
    var view = UIView(){
        didSet{
            setUI()
        }
    }
    var label = UILabel()
    var title = ""
    var titleLabelTextFont = UIFont.systemFont(ofSize: 12)
    var titleLabelHeight:CGFloat = 21
    var titleLabelTextAlignment = NSTextAlignment.center
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    func setUI(){
        addSubview(view)
        addSubview(label)
//        view.snp.makeConstraints { (make) in
//            make.left.right.top.bottom.equalToSuperview()
//        }
//        label.snp.makeConstraints { (make) in
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//            make.height.equalTo(20)
//            make.bottom.equalToSuperview().offset(-20)
//        }

        view.frame = bounds
        label.text = title
        label.textAlignment = titleLabelTextAlignment
        
    }
    override func layoutSubviews() {
        view.frame = bounds
        label.frame = CGRect(x: 0, y: bounds.height - titleLabelHeight - 20, width: bounds.width, height: titleLabelHeight)
    }
}
