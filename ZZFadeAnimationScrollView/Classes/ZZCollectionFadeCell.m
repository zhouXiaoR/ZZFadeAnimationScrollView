//
//  ZZCollectionFadeCell.m
//  ZZFadeAnimationScrollView_Example
//
//  Created by 周晓瑞 on 2018/12/12.
//  Copyright © 2018 zhouXiaoR. All rights reserved.
//

#import "ZZCollectionFadeCell.h"

@interface ZZCollectionFadeCell ()
@property(nonatomic,weak)UIImageView *imgView;
@end

@implementation ZZCollectionFadeCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        [self imgView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];

    self.imgView.frame = self.bounds;
}

- (void)setSubPlaceHolderView:(UIView *)subPlaceHolderView{
    if (!_subPlaceHolderView && subPlaceHolderView) {
        _subPlaceHolderView = subPlaceHolderView;
        if (subPlaceHolderView) {
            [self.contentView addSubview:subPlaceHolderView];
            [self.contentView bringSubviewToFront:subPlaceHolderView];
        }
    }
}

- (void)setAnimationViewOffset:(CGFloat)animationViewOffset{
    _animationViewOffset = animationViewOffset;

    CGRect frame = self.imgView.frame;
    frame.origin.x = animationViewOffset;
    self.imgView.frame = frame;
}

- (UIImageView *)imgView{
    if (_imgView == nil) {
        UIImageView * imgv = [[UIImageView alloc]init];
        imgv.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:imgv];
        _imgView = imgv;
    }
    return _imgView;
}

@end
