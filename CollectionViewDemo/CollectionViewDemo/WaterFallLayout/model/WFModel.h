//
//  WFModel.h
//  CollectionViewDemo
//
//  Created by ALittleNasty on 2016/12/12.
//  Copyright © 2016年 vcredit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WFModel : NSObject

@property (nonatomic, strong) UIImage *image;

@property (nonatomic,   copy) NSString *desc;

+ (instancetype)wfModelWithImage:(UIImage *)image description:(NSString *)desc;

@end
