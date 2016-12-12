//
//  WFCollectionViewCell.h
//  CollectionViewDemo
//
//  Created by ALittleNasty on 2016/12/12.
//  Copyright © 2016年 vcredit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WFModel;

@interface WFCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *customImage;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;


@property (nonatomic, strong) WFModel *model;


@end
