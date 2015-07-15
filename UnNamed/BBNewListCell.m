//
//  BBNewListCell.m
//  UnNamed
//
//  Created by T on 15/7/15.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "BBNewListCell.h"
#import "BBNewListModel.h"

@interface BBNewListCell ()
@property (weak, nonatomic) IBOutlet UILabel *hostIDLab;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@end

@implementation BBNewListCell

- (void)dataFill{
    //类型强转
    BBNewListModel *model =(BBNewListModel *) self.model;
    self.hostIDLab.text = [NSString stringWithFormat:@"%@",@(model.hostID)];
    self.titleLab.text = model.title;
    self.contentLab.text = model.content;
}

@end
