//
//  WaterFallController.m
//  CollectionViewDemo
//
//  Created by ALittleNasty on 2016/12/12.
//  Copyright © 2016年 vcredit. All rights reserved.

// controller
#import "WaterFallController.h"

// view
#import "WFCollectionViewCell.h"

// model
#import "WFModel.h"

// tool
#import "CHTCollectionViewWaterfallLayout.h"
#import "UICollectionViewCell+Nib.h"

static NSString *cellID = @"_WFCollectionViewCellIdentifier";

@interface WaterFallController ()<UICollectionViewDelegate,
                                  UICollectionViewDataSource,
                                  CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *heightArray;

@end

@implementation WaterFallController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureData];
    [self initSubview];
}

#pragma mark - Initialization
- (void)initSubview
{
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.minimumColumnSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    [_collectionView registerNib:[WFCollectionViewCell nib] forCellWithReuseIdentifier:cellID];
}

#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WFCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    cell.model = self.dataArray[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    WFModel *model = self.dataArray[indexPath.row];
    
    NSLog(@"点击%@",model.desc);
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellWidth = ([UIScreen mainScreen].bounds.size.width - 30.f) * 0.5;
    CGFloat cellHeight = [self.heightArray[indexPath.item] floatValue];
    
    return CGSizeMake(cellWidth, cellHeight);
}

#pragma mark - Util
- (void)configureData
{
    self.dataArray = [NSMutableArray array];
    self.heightArray = [NSMutableArray array];
    
    CGFloat cellWidth = ([UIScreen mainScreen].bounds.size.width - 30.f) * 0.5;
    
    for (NSInteger i = 0; i <= 25; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"wf%zd", i];
        NSString *desc = [NSString stringWithFormat:@"第%zd张", i];
        UIImage *img = [UIImage imageNamed:imageName];
        
        WFModel *model = [WFModel wfModelWithImage:img description:desc];
        [self.dataArray addObject:model];
        
        CGFloat cellHeight = cellWidth * img.size.height / img.size.width;
        cellHeight += 20.f;
        [self.heightArray addObject:@(cellHeight)];
    }
}


@end
