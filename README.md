# TdwCircleView
这是一个可以垂直和水平轮动轮播任意UIView的工具类,可以把控制器的View添加,进去设置自动滚动就可以使用了,可以把Xib放进去,也可以放纯代码的UiView
- 自动循环滚动auto circle scroll
- 控制器视图可以交互 UIView User Interaction enabled

- ![1](https://user-images.githubusercontent.com/47501317/120063380-87743000-c099-11eb-865c-7f4951e11b8f.gif)
![2](https://user-images.githubusercontent.com/47501317/120063529-2862eb00-c09a-11eb-90e5-a02233fd669d.gif)

#使用方法

直接拖拽这2个文件到项目中,然后使用:
#swift 使用方法:
```swift
TdwCircleView.swift
TdwCircleViewCell.swift

let tdwCircleV2 = TdwCircleView()//设置成成员变量,防止被释放
let vc1 = VC1()//3个要添加的控制器
let vc2 = VC2()
let vc3 = VC3()

//下面是设置
override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tdwCircleV)
        tdwCircleV.frame = CGRect(x: 20, y: 400, width: view.bounds.width - 40, height: 300)
        tdwCircleV.views = [vc1.view,vc2.view,vc3.view] //视图数组 Views array
        tdwCircleV.isVertical = false //是否是垂直滚动 is vertical scrolling
        tdwCircleV.autoScroll = true    //是否自动滚动 is can scroll
        tdwCircleV.pageControl.isHidden = false //是否显示页面 , page is hidden
        tdwCircleV.timeInterval = 2 //时间间隔 time interval
        tdwCircleV.didSelect { index in  //点击回调  , click block
            print("水平视图选中了\(index)行")
        }
        tdwCircleV.titles = ["第一个","第二个","第三个"] //标题 title
 }
 
```
objective c:
项目中先包含桥接文件:
```objectivec
#import "项目名字-Swift.h" //swift桥接文件
@property (strong,nonatomic)TdwCircleView* tdwCircleV2;
@property (strong,nonatomic)VC1* vc1;
@property (strong,nonatomic)VC2* vc2;
@property (strong,nonatomic)VC3* vc3;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tdwCircleV2 = [[TdwCircleView alloc]init];
    //添加3个纯代码的 UIView,
    //add 3 view only by coding without Contrllor or xib
    [self.view addSubview:self.tdwCircleV2];
    self.vc1 = [[VC1 alloc]init];
    self.vc2 = [[VC2 alloc]init];
    self.vc3 = [[VC3 alloc]init];
    
    self.tdwCircleV2.views = [NSArray arrayWithObjects :self.vc1.view,self.vc2.view,self.vc3.view, nil];
   
    self.tdwCircleV2.isVertical = true;
    self.tdwCircleV2.autoScroll = true;
        self.tdwCircleV2.timeInterval = 2;
    [self.tdwCircleV2 didSelectWithBlock:^(NSInteger index) {
            NSLog(@"垂直视图选中了%ld列",index);
    }];
    self.tdwCircleV2.frame = CGRectMake(20, 500, self.view.bounds.size.width - 40, 300);
    
}



```
