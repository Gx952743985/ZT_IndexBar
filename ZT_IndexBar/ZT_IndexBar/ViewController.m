//
//  ViewController.m
//  ZT_IndexBar
//
//  Created by _ziTai on 16/3/17.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "ViewController.h"
#import "ZT_IndexBar.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,ZT_IndexBarrDelegate>
{
    NSArray     *sectionArr;
    ZT_IndexBar *_IndexBar;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    sectionArr = [[NSArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    //创建使用
    _IndexBar = [[ZT_IndexBar alloc]init];
    _IndexBar.frame = CGRectMake(CGRectGetMaxX(self.view.frame) - 20,(self.view.frame.size.height - sectionArr.count * 15)/2.0, 20, sectionArr.count * 15);
    _IndexBar.delegate = self;
    //设置索引数组
    [_IndexBar setIndexes:sectionArr];
    //设置索引字体颜色
    _IndexBar.textColor = [UIColor blueColor];
    //添加
    [self.view addSubview:_IndexBar];
    
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.sectionHeaderHeight = 20;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return sectionArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@123456789 ",[sectionArr objectAtIndex:indexPath.section]];
    return cell;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return sectionArr[section];
}
#pragma mark - ZT_IndexBarrDelegate
- (void)tableViewIndexBar:(ZT_IndexBar*)indexBar didSelectSectionAtIndex:(NSInteger)index
{
    if ([_myTableView numberOfSections] > index && index > -1)
    {
        //table滑动到指定位置
        [_myTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]
                             atScrollPosition:UITableViewScrollPositionTop
                                     animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
