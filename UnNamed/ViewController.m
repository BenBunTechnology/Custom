//
//  ViewController.m
//  UnNamed
//
//  Created by T on 15/7/10.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "ViewController.h"
#import "UnNamed-Swift.h"
#define KSCARE 0.8

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *groupArrays;
@property (nonatomic, assign) CGFloat distance;
@property (nonatomic, weak) UIButton *coverBtn;
@property (nonatomic, weak) UIView *mainView;
@property (nonatomic, strong) UISwipeGestureRecognizer *recognizer;
@end

@implementation ViewController

- (NSArray *)groupArrays{
    if (!_groupArrays) {
        _groupArrays =@[@[@"金星"], @[@"火星"], @[@"土星"], @[@"木星"], @[@"水星"]];
    }
    return _groupArrays;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BBCOLOR(22, 51, 73);
    
    self.navigationController.navigationBarHidden = YES;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * KSCARE, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.sectionFooterHeight = 10;
    tableView.sectionHeaderHeight = 0;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    BBGoViewController *tabBarVc = [[BBGoViewController alloc] init];
    tabBarVc.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tabBarVc.view];
    [self addChildViewController:tabBarVc];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groupArrays.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *rowArray = self.groupArrays[section];
    return rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"leftCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor clearColor];
        UIView *backgroudView = [[UIView alloc] init];
        backgroudView.backgroundColor = BBCOLOR(0, 57, 81);
        cell.selectedBackgroundView = backgroudView;
        
    }
    cell.textLabel.text = self.groupArrays[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BBLeftViewController *leftVc = [[BBLeftViewController alloc] init];
    leftVc.title = self.groupArrays[indexPath.section][indexPath.row];
    [self.navigationController pushViewController:leftVc animated:YES];
}

@end
