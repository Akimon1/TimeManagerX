//
//  TMListCollectionViewFlowLayout.m
//  TimeManagerX
//
//  Created by yu on 3/6/17.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMListCollectionViewFlowLayout.h"

@interface TMListCollectionViewFlowLayout ()

@property (nonatomic, assign) CGFloat previousOffset;

@end

@implementation TMListCollectionViewFlowLayout

- (void)prepareLayout {
    self.itemSize = CGSizeMake(self.collectionView.frame.size.width - 60,self.collectionView.frame.size.height - 180);
    self.minimumLineSpacing = 20;
    self.sectionInset = UIEdgeInsetsMake(20, 30, 83, 30);
    
    [super prepareLayout];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *superAttributes = [super layoutAttributesForElementsInRect:rect];
    NSArray *attributes = [[NSArray alloc] initWithArray:superAttributes copyItems:YES];
    
    CGRect visibleRect = CGRectZero;

    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.frame.size;
    
    CGFloat offset = CGRectGetMinY(visibleRect);
    
    [attributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat distance =  obj.center.y - fabs(offset) - self.itemSize.width;
        CGFloat widthForScale = distance / self.itemSize.height;
        
        CGFloat zoom = 1 + 0.15 * (1 - fabs(widthForScale));
        obj.transform3D = CATransform3DMakeScale(zoom, 1.0, 1.0);
    }];
    
    return attributes;
}

@end


