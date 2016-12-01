//
//  YYCollectionHeaderView.m
//  CollectionViewDemo
//
//  Created by ALittleNasty on 2016/12/1.
//  Copyright © 2016年 vcredit. All rights reserved.
//

#import "YYCollectionHeaderView.h"

@implementation YYCollectionHeaderView

{
    UILabel *textLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        textLabel = [[UILabel alloc] initWithFrame:CGRectInset(CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame)), 30, 10)];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = [UIColor whiteColor];
        textLabel.font = [UIFont boldSystemFontOfSize:20];
        [self addSubview:textLabel];
    }
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    [self setText:@""];
}

- (void)setText:(NSString *)text
{
    _text = [text copy];
    
    [textLabel setText:_text];
}

@end
