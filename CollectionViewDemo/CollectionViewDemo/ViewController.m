//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by ALittleNasty on 2016/12/1.
//  Copyright © 2016年 vcredit. All rights reserved.
//

#import "ViewController.h"
#import "WaterFallController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = nil;
    
    self.dataArray = @[@"瀑布流",@"第二章",@"第三章",@"第四章"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor greenColor];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Italic" size:20.f];
    cell.backgroundColor = [UIColor colorWithRed:0.2 green:0.4 blue:0.7 alpha:1.f];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *pushedVC = nil;
    switch (indexPath.row) {
        case 0: {
            WaterFallController *wfVC = [[WaterFallController alloc] init];
            pushedVC = wfVC;
        }
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:pushedVC animated:YES];
}
@end
