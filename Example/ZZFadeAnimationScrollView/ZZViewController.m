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
    av.frame = self.view.bounds;
    av.animationScale = 1.0f;
    av.animationScrollDataSoure = self;
    av.pageAnimationVisiableOffset = 200.0f;
    av.placeViewAnimationOption = ZZPlaceViewAnimationOptionAlpha | ZZPlaceViewAnimationOptionScale;
    [self.view addSubview:av];

    //  这里暂时取本地图片
    NSString * path0 = [[NSBundle mainBundle]pathForResource:@"0.jpg" ofType:nil];
    NSString * path1 = [[NSBundle mainBundle]pathForResource:@"1.jpg" ofType:nil];
    NSString * path2 = [[NSBundle mainBundle]pathForResource:@"2.jpg" ofType:nil];
    NSString * path3 = [[NSBundle mainBundle]pathForResource:@"3.jpg" ofType:nil];
    NSString * path4 = [[NSBundle mainBundle]pathForResource:@"4.jpg" ofType:nil];
    av.URLs = @[path0,path1,path2,path3,path4];
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
