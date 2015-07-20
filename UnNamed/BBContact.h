//
//  BBContact.h
//  UnNamed
//
//  Created by T on 15/7/17.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBContactModel.h"

@interface BBContact : BBContactModel
// 自增主键
@property NSInteger id;
@property (nonatomic, copy)NSString *displayName;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, strong) NSArray *phoneNumbers;
@end
