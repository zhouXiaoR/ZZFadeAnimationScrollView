//
//  ZZFadeAnimationScrollView.h
//  ZZFadeAnimationScrollView_Example
//
//  Created by 周晓瑞 on 2018/12/12.
//  Copyright © 2018 zhouXiaoR. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_OPTIONS(NSUInteger, ZZPlaceViewAnimationOption) {
    ZZPlaceViewAnimationOptionNone       = 0,
    ZZPlaceViewAnimationOptionScale  = 1 << 0,
    ZZPlaceViewAnimationOptionAlpha     = 1 << 1,
};

@class ZZFadeAnimationScrollView;
@protocol ZZFadeAnimationScrollViewDataSource <NSObject>
@optional
- (UIView *)fadeAnimationView:(ZZFadeAnimationScrollView *)fadeScrollView
                               indexPath:(NSIndexPath*)indexPath;
@end

@protocol ZZFadeAnimationScrollViewDelegate <NSObject>
@optional
- (void)fadeAnimationView:(ZZFadeAnimationScrollView *)fadeScrollView
           didSelectIndexPath:(NSIndexPath*)indexPath;
@end

NS_ASSUME_NONNULL_BEGIN

@interface ZZFadeAnimationScrollView : UIView

@property(nonatomic,strong)NSArray <NSURL *>*URLs;

@property(nonatomic,assign)CGFloat animationScale;

/**
 视觉位移差值
 */
@property(nonatomic,assign)CGFloat pageAnimationVisiableOffset;

/**
 动画样式枚举
 */
@property(nonatomic,assign)ZZPlaceViewAnimationOption placeViewAnimationOption;

@property(nonatomic,weak)id <ZZFadeAnimationScrollViewDataSource> animationScrollDataSoure;
@property(nonatomic,weak)id <ZZFadeAnimationScrollViewDelegate> animationScrollDelegate;

@end

NS_ASSUME_NONNULL_END
