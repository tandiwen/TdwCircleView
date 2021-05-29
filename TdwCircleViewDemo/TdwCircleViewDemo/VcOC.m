//
//  VcOC.m
//  TdwCircleViewDemo
//
//  Created by 谭迪文 on 2021/5/29.
//

#import "VcOC.h"
#import "TdwCircleViewDemo-Swift.h"
#import <TdwCircleView/TdwCircleView.h>
@interface VcOC ()
@property (strong,nonatomic)TdwCircleView* tdwCircleV2;
@property (strong,nonatomic)VC1* vc1;
@property (strong,nonatomic)VC2* vc2;
@property (strong,nonatomic)VC3* vc3;

@end

@implementation VcOC




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
        self.tdwCircleV2.timeInterval = 0.5;
    [self.tdwCircleV2 didSelectWithBlock:^(NSInteger index) {
            NSLog(@"垂直视图选中了%ld列",index);
    }];
    
    
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tdwCircleV2.frame = CGRectMake(100, 50, self.view.bounds.size.width - 40, 300);
    
}

@end
