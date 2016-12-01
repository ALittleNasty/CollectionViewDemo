//
//  CustomFlowLayoutController.m
//  CollectionViewDemo
//
//  Created by ALittleNasty on 2016/12/1.
//  Copyright © 2016年 vcredit. All rights reserved.
//

#import "CustomFlowLayoutController.h"
#import "YYCollectionViewFlowLayout.h"
#import "YYCollectionViewCell.h"

static NSString *cellID = @"YYCollectionViewCellIdentifier";

@interface CustomFlowLayoutController ()<UICollectionViewDelegate,
                                         UICollectionViewDataSource,
                                         UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *images;

@end

@implementation CustomFlowLayoutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.images = [NSMutableArray array];
    for (NSInteger i = 0; i < 30; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%zd.jpg", i];
        UIImage *img = [UIImage imageNamed:imageName];
        [self.images addObject:img];
    }
    
    YYCollectionViewFlowLayout *layout = [[YYCollectionViewFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[YYCollectionViewCell class] forCellWithReuseIdentifier:cellID];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    
    return cell;
}

@end
