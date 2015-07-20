//
//  BBTel.m
//  UnNamed
//
//  Created by T on 15/7/17.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "BBTel.h"

@implementation BBTel

+(LKDBHelper *)getUsingLKDBHelper {
    return [BBContactModel getUsingLKDBHelper];
}

// 表名
+(NSString *)getTableName {
    return @"bbx_tel";
}

// 主键
+(NSString *)getPrimaryKey {
    return @"id";
}

// 保存后是否更新主键id到model中
+(BOOL)autoIncreatPrimaryKey {
    return YES;
}

@end
