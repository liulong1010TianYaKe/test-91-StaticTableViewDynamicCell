//
//  ViewController.m
//  test-91-StaticTableViewDynamicCell
//
//  Created by Kyo on 17/2/16.
//  Copyright © 2016 hzins. All rights reserved.
//

#import "TableViewController.h"

/*
 UITableViewController 静态cell动态使用的方法：
 静态方式默认创建好cell，用属性存储。
 添加一个arrayDisplayCell用来存储动态显示的cell
 实现相应委托（必须的，如果要静态cell实现动态增删就必须实现对应的委托。［需要什么实现什么，比如这里高度不需要动态，可以不实现高度的委托］）
 */

@interface TableViewController ()

@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *arrayCell;
@property (strong, nonatomic) NSMutableArray *arrayDisplayCell;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _arrayDisplayCell = [_arrayCell mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [_arrayDisplayCell removeObjectAtIndex:1];
    
    //第一种方式动态移除，指定移除项
    {
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];
    }
    
    //第二种方式动态移除，直接reload
    {
//    [self.tableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayDisplayCell.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _arrayDisplayCell[indexPath.row];
}

@end
