//
//  YYCollectionViewCell.h
//  CollectionViewDemo
//
//  Created by ALittleNasty on 2016/12/1.
//  Copyright © 2016年 vcredit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

-(void)setDisabled:(BOOL)disabled;

@end
