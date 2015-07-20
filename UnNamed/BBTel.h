//
//  BBTel.h
//  UnNamed
//
//  Created by T on 15/7/17.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "BBContactModel.h"

@interface BBTel : BBContactModel
// 数据库自增Id
@property NSInteger id;
// 联系人id
@property NSInteger contactId;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, assign) BOOL pref;
@end
