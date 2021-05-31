//
//  TdwCircleView.swift
//  TdwCircleViewDemo
//
//  Created by 谭迪文 on 2021/5/21.
//

import UIKit

public class TdwCircleView: UIView,UICollectionViewDataSource, UICollectionViewDelegate{
    public typealias Block = (Int)->()
    @objc public var block:Block?
    let ID = "TdwCircleViewCell"
    var timer = Timer()
    var mainView:UICollectionView!
    @objc public var pageControl = UIPageControl()
    var currentPage = 0//当前显示的页数
    @objc public var infiniteLoop = true //是否无线循环
    @objc public var timeInterval:TimeInterval = 1 //时间间隔,几秒滚动一次
    @objc public  var autoScroll = false
    {
        didSet{
            
            setAutoScroll(autoScroll)
        }
        
    } //是否自动滚动
    @objc public  var views = [UIView](){//子视图数组
        didSet{
            totalItemsCount = CGFloat(infiniteLoop ? views.count * Int(muti) : views.count)
        }
    }
    
    
    
    @objc public var titles = [String]()//下面的标题
    
    @objc public   var isVertical = false  //是否是垂直滚动
    
    var flowLayout = UICollectionViewFlowLayout()
    let muti:CGFloat = 100
    var totalItemsCount:CGFloat = 0 //全体轮播图数量
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @objc public func didSelect(block:@escaping Block){
        self.block = block
    }
    
    func pageControlIndexWithCurrentCellIndex(_ index: Int) -> Int {
        return index % views.count
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Int(totalItemsCount)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ID, for: indexPath) as! TdwCircleViewCell
        let itemIndex = indexPath.row % views.count
        if titles.count >= itemIndex && titles.count > 0{
            cell.title = titles[itemIndex]
        }
        cell.view = views[itemIndex]
        
        return cell
    }
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if block != nil{
            block!(indexPath.row % views.count)
        }
    }
    
    func setAutoScroll(_ autoScroll:Bool){
        
        if autoScroll {
            //启动timer
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            RunLoop.main.add(timer, forMode: .common)//默认模式下拖拽界面,timer会停止
        }
        
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setUI()
    }
    
    
    //MARK: - 设置 的collectionView
    func setupMainView(){
        //  Converted to Swift 5.4 by Swiftify v5.4.24180 - https://swiftify.com/
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = isVertical ? .vertical : .horizontal
        self.flowLayout = flowLayout
        let mainView = UICollectionView(frame: bounds, collectionViewLayout: flowLayout)
        addSubview(mainView)
        mainView.frame = self.bounds
        mainView.backgroundColor = UIColor.clear
        mainView.isPagingEnabled = true
        mainView.showsHorizontalScrollIndicator = false
        mainView.showsVerticalScrollIndicator = false
        mainView.register(TdwCircleViewCell.self, forCellWithReuseIdentifier: ID)
        
        mainView.dataSource = self
        mainView.delegate = self
        mainView.scrollsToTop = false
        mainView.bounces = false
        
        if views.count < 2{
            mainView.isScrollEnabled = false
        }else{
            mainView.isScrollEnabled = true
        }
        
        self.mainView = mainView
    }
    func setUI(){
        setupMainView()
        setupPageControl()
        setAutoScroll(autoScroll)
        
    }
    func setupPageControl(){
        
        
        if isVertical {
            //垂直方向不添加pageControl
            return
        }
        pageControl.removeFromSuperview()
        if views.count < 2{
            return
        }
        pageControl.numberOfPages = views.count
        pageControl.currentPage = currentIndex()
        pageControl.pageIndicatorTintColor = UIColor.gray
        self.addSubview(pageControl)
        
        
        
        
        pageControl.frame = CGRect(x: 0, y: bounds.height - 20 , width: bounds.width, height: 20)
        
    }
    //MARK: - 计算当前页
    func currentIndex()->Int{
        
        if self.bounds.width == 0 || self.bounds.height == 0{
            return 0
        }
        
        var index:CGFloat = 0
        if flowLayout.scrollDirection == UICollectionView.ScrollDirection.horizontal{
            index = (mainView.contentOffset.x + bounds.width * 0.5) / bounds.width
        }else{
            index = (mainView.contentOffset.y + bounds.height * 0.5) / bounds.height
        }
        
        if index > 0 {
            return Int(index)//取整数部分
        }else{
            return 0
        }
    }
    @objc func runTimer(){
        
        if views.count < 2 {
            return
        }
        if isVertical{
            let currentIndex = currentIndex()
            scrollToIndex(currentIndex + 1)//滚动到当前页的下一页
        }else{
            let currentIndex = currentIndex()
            scrollToIndex(currentIndex + 1)
        }
        
    }
    //MARK: - 滚动到页数
    func scrollToIndex(_ targetIndex:Int){
        
        var targetIndex = CGFloat(targetIndex)
        if targetIndex >= totalItemsCount {
            if infiniteLoop {
                targetIndex = totalItemsCount * 0.5
                mainView.scrollToItem(at: IndexPath(item: Int(targetIndex - 1), section: 0), at: [], animated: false)
            }
            
        }
        
        mainView.scrollToItem(at: IndexPath(item: Int(targetIndex), section: 0), at: [], animated: true)
        
        
    }
    
    //MARK: - UIScrollViewDelegate
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //MARK: - 设置移动时候的页码
        if views.count < 2 {
            return //
        }
        let itemIndex = currentIndex()
        pageControl.currentPage = pageControlIndexWithCurrentCellIndex(itemIndex)
        
        if isVertical {
            if mainView.contentOffset.y >= CGFloat(views.count * Int(muti) - 1) * mainView.bounds.height{
                mainView.scrollToItem(at: IndexPath(item: Int(CGFloat(views.count) * muti * 0.5), section: 0), at: [], animated: false)
            }else if mainView.contentOffset.y <= CGFloat(views.count ) * mainView.bounds.height {
                mainView.scrollToItem(at: IndexPath(item: Int(CGFloat(views.count) * muti * 0.5), section: 0), at: [], animated: false)
            }
            
        }else{
            if mainView.contentOffset.x >= CGFloat(views.count * Int(muti) - 1) * mainView.bounds.width{
                mainView.scrollToItem(at: IndexPath(item: Int(CGFloat(views.count) * muti * 0.5), section: 0), at: [], animated: false)
            }else if mainView.contentOffset.x <= CGFloat(views.count ) * mainView.bounds.width {
                mainView.scrollToItem(at: IndexPath(item: Int(CGFloat(views.count) * muti * 0.5), section: 0), at: [], animated: false)
            }
            
        }
        
        
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if autoScroll{
            timer.invalidate()
        }
    }
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        setAutoScroll(autoScroll)
    }
    
}

extension TdwCircleView:UICollectionViewDelegateFlowLayout{
    //cell尺寸,如果图片自己有尺寸就不显示这个尺寸
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width , height: bounds.height )
    }
    
    //设置内边距,一般设置0,这样cell 的size方便计算
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}



