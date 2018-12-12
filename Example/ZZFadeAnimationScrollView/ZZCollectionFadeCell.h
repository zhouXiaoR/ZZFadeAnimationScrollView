//
//  ZZCollectionFadeCell.h
//  ZZFadeAnimationScrollView_Example
//
//  Created by 周晓瑞 on 2018/12/12.
//  Copyright © 2018 zhouXiaoR. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZCollectionFadeCell : UICollectionViewCell

@property(nonatomic,weak)UIView * subPlaceHolderView;

@property(nonatomic,assign)CGFloat animationViewOffset;

@property(nonatomic,weak,readonly)UIImageView *imgView;

@end

NS_ASSUME_NONNULL_END
