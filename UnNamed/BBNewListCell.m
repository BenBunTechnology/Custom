//
//  BBNewListCell.m
//  UnNamed
//
//  Created by T on 15/7/15.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "BBNewListCell.h"
#import "BBNewListModel.h"
#import "UIImageView+WebCache.h"

@interface BBNewListCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *replyLab;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@end

@implementation BBNewListCell

- (void)dataFill{
    //类型强转
    BBNewListModel *model =(BBNewListModel *) self.model;
    self.titleLab.text = model.title;
    self.replyLab.text = [NSString stringWithFormat:@"%tu跟帖", model.replyCount];
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:[UIImage imageNamed:@"OPDiscoverPlaceholderImage_left"]];
}

@end
