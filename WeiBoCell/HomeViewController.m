//
//  HomeViewController.m
//  WeiBoCell
//
//  Created by Shen Yuan on 15/9/17.
//  Copyright (c) 2015年 Shen Yuan. All rights reserved.
//

#import "HomeViewController.h"
#import "Model.h"
#import "WeiBoCell.h"
#import "StatusFrame.h"

// RGB颜色
#define HWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface HomeViewController ()
@property (nonatomic, strong) NSMutableArray *arr;
@end

@implementation HomeViewController

/*
- (NSMutableArray *)arr {
    if (!_arr) {
        //创建模型数组
        _arr = [NSMutableArray array];
        //获取plst文件路径
        NSString *file = [[NSBundle mainBundle] pathForResource:@"StatusPlist" ofType:@"plist"];
        NSLog(@"%@", file);
        // 从plist文件中加载一个数组对象(这个数组中存放的都是NSDictionary对象)
        NSArray *dictArray = [[NSArray alloc] initWithContentsOfFile:file];
        NSLog(@"%@", dictArray);
        // 将 “字典数组” 转换为 “模型数据”
        for (NSDictionary *dict in dictArray) { // 遍历每一个字典
            // 将 “字典” 转换为 “模型”
            Model *model = [Model modelWithDictionary:dict];
            // 将 “模型” 添加到 “模型数组中”
            [_arr addObject:model];
        }
        
        
        NSLog(@"%@", self.arr);
    }
    return _arr;
}
*/
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = HWColor(211, 211, 211);
    //创建模型数组
    _arr = [NSMutableArray array];
    //获取plst文件路径
    NSString *file = [[NSBundle mainBundle] pathForResource:@"StatusPlist" ofType:@"plist"];
    NSLog(@"%@", file);
    // 从plist文件中加载一个数组对象(这个数组中存放的都是NSDictionary对象)
    NSArray *dictArray = [[NSArray alloc] initWithContentsOfFile:file];
    NSLog(@"%@", dictArray);
    // 将 “字典数组” 转换为 “模型数据”
    for (NSDictionary *dict in dictArray) { // 遍历每一个字典
        StatusFrame *f = [[StatusFrame alloc] init];
        // 将 “字典” 转换为 “模型”
        f.model = [Model modelWithDictionary:dict];
        // 将 “模型” 添加到 “模型数组中”
        [_arr addObject:f];

    }
    
//    self.tableView.rowHeight = 300;
}



#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //获得cell
    WeiBoCell *cell = [WeiBoCell cellWithTableView:tableView];
    cell.statusFrame = self.arr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusFrame *frame = self.arr[indexPath.row];
    return frame.cellHeight;
}


@end
