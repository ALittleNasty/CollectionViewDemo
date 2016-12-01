//
//  YYDecorationView.m
//  CollectionViewDemo
//
//  Created by ALittleNasty on 2016/12/1.
//  Copyright © 2016年 vcredit. All rights reserved.
//

#import "YYDecorationView.h"

@implementation YYDecorationView

{
    UIImageView *binderImageView;
}

- (id)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    
    binderImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"binder"]];
    binderImageView.frame = CGRectMake(10, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
    binderImageView.contentMode = UIViewContentModeLeft;
    binderImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self addSubview:binderImageView];
    
    return self;
}

@end
