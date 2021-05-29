//
//  VcOC.m
//  TdwCircleViewDemo
//
//  Created by 谭迪文 on 2021/5/29.
//

#import "VcOC.h"
#import "TdwCircleViewDemo-Swift.h"
@interface VcOC ()
@property (strong,nonatomic)TdwCircleView* tdwCircleV2;
@property (strong, nonatomic) IBOutlet TdwCircleView *tdwCircleV;
@property (strong,nonatomic)VC1* vc1;
@property (strong,nonatomic)VC2* vc2;
@property (strong,nonatomic)VC3* vc3;

@property (strong,nonatomic)VC1* vc1a;
@property (strong,nonatomic)VC2* vc2a;
@property (strong,nonatomic)VC3* vc3a;

@end

@implementation VcOC




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.vc1a = [[VC1 alloc]init];
    self.vc2a = [[VC2 alloc]init];
    self.vc3a = [[VC3 alloc]init];
    
    
    self.tdwCircleV.views = [NSArray arrayWithObjects :self.vc1a.view,self.vc2a.view,self.vc3a.view, nil];
   
    self.tdwCircleV.isVertical = false;
    self.tdwCircleV.autoScroll = true;
        self.tdwCircleV.timeInterval = 2;
    [self.tdwCircleV didSelectWithBlock:^(NSInteger index) {
            NSLog(@"垂直视图选中了%ld列",index);
    }];
    
    
    
    
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
    
    
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tdwCircleV2.frame = CGRectMake(20, 500, self.view.bounds.size.width - 40, 300);
    
}

@end
