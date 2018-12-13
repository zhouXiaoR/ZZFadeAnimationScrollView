//
//  ZZViewController.m
//  ZZFadeAnimationScrollView
//
//  Created by zhouXiaoR on 12/12/2018.
//  Copyright (c) 2018 zhouXiaoR. All rights reserved.
//

#import "ZZViewController.h"
#import "ZZFadeAnimationScrollView.h"

@interface ZZViewController ()<ZZFadeAnimationScrollViewDataSource>

@end

@implementation ZZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    ZZFadeAnimationScrollView * av = [[ZZFadeAnimationScrollView alloc]init];
    av.frame = CGRectMake(10, 100, 200, 150);
    av.animationScale = 1.0f;
    av.animationScrollDataSoure = self;
    av.pageAnimationVisiableOffset = 100.0f;
    av.placeViewAnimationOption = ZZPlaceViewAnimationOptionAlpha | ZZPlaceViewAnimationOptionScale;
    [self.view addSubview:av];

    NSString * path0 = @"http://img3.imgtn.bdimg.com/it/u=555355341,1991866122&fm=26&gp=0.jpg";
    NSString * path1 = @"http://img1.imgtn.bdimg.com/it/u=2897148561,2392818500&fm=26&gp=0.jpg";
    NSString * path2 = @"http://img5.imgtn.bdimg.com/it/u=1018416196,4262336975&fm=26&gp=0.jpg";
    NSString * path3 = @"http://img1.imgtn.bdimg.com/it/u=1449119497,4241614660&fm=26&gp=0.jpg";
    NSString * path4 = @"http://img3.imgtn.bdimg.com/it/u=933174695,1351199266&fm=26&gp=0.jpg";
    NSString * path5 = @"http://img2.imgtn.bdimg.com/it/u=1434322746,2969731710&fm=26&gp=0.jpg";
     NSString * path6 = @"http://img3.imgtn.bdimg.com/it/u=1285197349,1557335780&fm=26&gp=0.jpg";

    av.URLs = @[path0,path1,path2,path3,path4,path5,path6];
}

- (UIView *)fadeAnimationView:(ZZFadeAnimationScrollView *)fadeScrollView indexPath:(NSIndexPath *)indexPath{
    UILabel * lab = [UILabel new];
    lab.numberOfLines = 0;
    lab.text = @"我是一个自定义的视图";
    lab.frame = CGRectMake(10, 100, 150, 100);
    lab.backgroundColor = [UIColor cyanColor];
    return lab;
}


@end
