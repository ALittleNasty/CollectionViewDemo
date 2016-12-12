//
//  WFCollectionViewCell.m
//  CollectionViewDemo
//
//  Created by ALittleNasty on 2016/12/12.
//  Copyright © 2016年 vcredit. All rights reserved.
//

#import "WFCollectionViewCell.h"
#import "WFModel.h"

@implementation WFCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - Setter

- (void)setModel:(WFModel *)model
{
    _model = model;
    
    _customImage.image = _model.image;
    _descLabel.text = _model.desc;
}

@end
