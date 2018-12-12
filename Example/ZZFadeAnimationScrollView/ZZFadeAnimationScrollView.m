//
//  ZZFadeAnimationScrollView.m
//  ZZFadeAnimationScrollView_Example
//
//  Created by 周晓瑞 on 2018/12/12.
//  Copyright © 2018 zhouXiaoR. All rights reserved.
//

#import "ZZFadeAnimationScrollView.h"
#import "ZZCollectionFadeCell.h"

static NSString * const CollectionFadeCellID = @"CollectionFadeCellID";

@interface ZZFadeAnimationScrollView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,weak)UICollectionView *colletionView;
@property(nonatomic,strong)UICollectionViewFlowLayout * flowLayout;
@end

@implementation ZZFadeAnimationScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initialized];
        [self setUp];
    }
    return self;
}

- (void)initialized{
    self.animationScale = 1.0f;
    self.placeViewAnimationOption = ZZPlaceViewAnimationOptionNone;
    self.pageAnimationVisiableOffset = 150.0f;
}

- (void)setUp{
    [self colletionView];
}

- (void)layoutSubviews{
    [super layoutSubviews];

    self.colletionView.frame = self.bounds;
}

- (void)setURLs:(NSArray<NSString *> *)URLs{
    _URLs = URLs;

    [self.colletionView reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZZCollectionFadeCell * fadeCell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionFadeCellID forIndexPath:indexPath];
    NSString *path = self.URLs[indexPath.row];
    UIImage * img = [UIImage imageWithContentsOfFile:path];
    fadeCell.imgView.image = img;
    
    if (self.animationScrollDataSoure && [self.animationScrollDataSoure respondsToSelector:@selector(fadeAnimationView:indexPath:)]) {
        fadeCell.subPlaceHolderView =
        [self.animationScrollDataSoure fadeAnimationView:self indexPath:indexPath];
    }

    return fadeCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.URLs.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.animationScrollDelegate && [self.animationScrollDelegate respondsToSelector:@selector(fadeAnimationView:didSelectIndexPath:)]) {
        [self.animationScrollDelegate fadeAnimationView:self didSelectIndexPath:indexPath];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    NSInteger leftIndex =  contentOffsetX / self.bounds.size.width;

    ZZCollectionFadeCell * leftCell = (ZZCollectionFadeCell *)[self.colletionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:leftIndex inSection:0]];
    ZZCollectionFadeCell * rightCell = (ZZCollectionFadeCell *)[self.colletionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:leftIndex + 1 inSection:0]];

    CGFloat px = contentOffsetX - leftIndex * self.bounds.size.width;
    CGFloat rate = px * 1.0 / self.bounds.size.width;
    CGFloat distanceX =  self.pageAnimationVisiableOffset * rate;
    leftCell.animationViewOffset = distanceX;
    rightCell.animationViewOffset = -self.pageAnimationVisiableOffset * (1 - rate);

    if (self.placeViewAnimationOption & ZZPlaceViewAnimationOptionNone)
        return;

    CGFloat leftRate = (1- rate) * self.animationScale;
    CGFloat rightRate = rate * self.animationScale;

    if (self.placeViewAnimationOption & ZZPlaceViewAnimationOptionScale) {
        leftCell.subPlaceHolderView.layer.affineTransform =
        CGAffineTransformMakeScale(leftRate, leftRate);
        rightCell.subPlaceHolderView.layer.affineTransform =
        CGAffineTransformMakeScale(rightRate, rightRate);
    }

    if (self.placeViewAnimationOption & ZZPlaceViewAnimationOptionAlpha) {
        leftCell.subPlaceHolderView.alpha = leftRate;
        rightCell.subPlaceHolderView.alpha = rightRate;
    }
}

#pragma mark - getter

- (UICollectionView *)colletionView{
    if (_colletionView == nil) {
        UICollectionView * collectionV = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        collectionV.showsVerticalScrollIndicator = NO;
        collectionV.showsHorizontalScrollIndicator = NO;
        collectionV.pagingEnabled = YES;
        collectionV.scrollsToTop = NO;
        collectionV.bounces = NO;
        collectionV.backgroundColor = [UIColor cyanColor];
        collectionV.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [collectionV registerClass:[ZZCollectionFadeCell class] forCellWithReuseIdentifier:CollectionFadeCellID];
        collectionV.delegate = self;
        collectionV.dataSource = self;
        if (@available(iOS 11.0, *)) {
            collectionV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [self addSubview:collectionV];
        _colletionView = collectionV;
    }
    return _colletionView;
}

- (UICollectionViewFlowLayout *)flowLayout{
    if (_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }
    return _flowLayout;
}

@end
