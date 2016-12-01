//
//  YYCollectionViewFlowLayout.m
//  CollectionViewDemo
//
//  Created by ALittleNasty on 2016/12/1.
//  Copyright © 2016年 vcredit. All rights reserved.
//


/*
 
    继承自UICollectionViewFlowLayout, 我们还需要重写2个方法: 
    (1):    layoutAttributesForElementsInRect:
    (2):    layoutAttributesForItemAtIndexPath:
    当collectionView在布局展示它的cell , supplementary view 和 decoration view 会调用这两个方法
    注意: 我们还会提供一个自己私有的方法applyLayoutAttributes:
 
 
 
 
 
 */


#import "YYCollectionViewFlowLayout.h"

@implementation YYCollectionViewFlowLayout

// override
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.sectionInset = UIEdgeInsetsMake(30.f, 80.f, 30.f, 20.f);
        self.minimumInteritemSpacing = 20.f;
        self.minimumLineSpacing = 20.f;
        self.itemSize = kMaxItemSize;
        self.headerReferenceSize = CGSizeMake(60.f, 70.f);
    }
    return self;
}

// override
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributeArray = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes * attribute in attributeArray) {
        
        [self applyLayoutAttributes:attribute];
    }
    
    return attributeArray;
}

// override
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes * attribute = [super layoutAttributesForItemAtIndexPath:indexPath];
    
    [self applyLayoutAttributes:attribute];
    
    return attribute;
}

// custom private method
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)attribute
{
    // 检查 representedElementKind 是否为空, 空表示这是一个cell, 而不是header或者decoration view
    if (attribute.representedElementKind == nil) {
        
        CGFloat width = [self collectionViewContentSize].width;
        CGFloat leftMargin = [self sectionInset].left;
        CGFloat rightMargin = [self sectionInset].right;
        
        // 当前这一组的cell的个数
        NSUInteger itemsInSection = [[self collectionView] numberOfItemsInSection:attribute.indexPath.section];
        // 单个cell所占的宽度(collectionView的宽度减去左右间距, 然后除以这一组cell的总个数)
        CGFloat singleItemWidth = (width - (leftMargin + rightMargin)) / itemsInSection;
        // 第一个cell的x位置
        CGFloat firstXPosition = singleItemWidth / 2;
        // 计算当前cell的x的位置
        CGFloat xPosition = firstXPosition + (2 * firstXPosition * attribute.indexPath.item);
        // 修改center的x值
        attribute.center = CGPointMake(leftMargin + xPosition, attribute.center.y);
        attribute.frame = CGRectIntegral(attribute.frame);
    }
}

@end
