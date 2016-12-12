//
//  WFModel.m
//  CollectionViewDemo
//
//  Created by ALittleNasty on 2016/12/12.
//  Copyright © 2016年 vcredit. All rights reserved.
//

#import "WFModel.h"

@implementation WFModel

+ (instancetype)wfModelWithImage:(UIImage *)image description:(NSString *)desc
{
    WFModel *model = [[WFModel alloc] init];
    
    model.image = image;
    model.desc = desc;
    
    return model;
}

@end
