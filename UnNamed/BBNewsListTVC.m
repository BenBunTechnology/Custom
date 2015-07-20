//
//  BBNewsListTVC.m
//  UnNamed
//
//  Created by T on 15/7/15.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "BBNewsListTVC.h"
#import "BBNewListModel.h"
#import "BBNewListCell.h"


@interface BBNewsListTVC ()

@end

@implementation BBNewsListTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.borderColor = [UIColor orangeColor].CGColor;
    self.view.layer.borderWidth = 0.3f;
    [self config];
}

- (void)config{
    LTConfigModel *configModel = [[LTConfigModel alloc] init];
    //url
    configModel.url=@"http://c.3g.163.com/nc/article/list/T1351233117091/0-20.html";
    //请求方式
    configModel.httpMethod=LTConfigModelHTTPMethodGET;
    //模型类
    configModel.ModelClass=[BBNewListModel class];
    //cell类
    configModel.ViewForCellClass=[BBNewListCell class];
    //标识
//    configModel.lid=NSStringFromClass(self.class);
//    //pageName
//    configModel.pageName=@"p";
//    //pageSizeName
//    configModel.pageSizeName=@"pagesize";
    //起始页码
//    configModel.pageStartValue=1;
    //行高
    configModel.rowHeight=80;
    
    //移除返回顶部:(默认开启)
    configModel.removeBackToTopBtn=NO;
    
    configModel.refreshControlType = LTConfigModelRefreshControlTypeBoth;
    
    //配置完毕
    self.configModel=configModel;
}

@end
