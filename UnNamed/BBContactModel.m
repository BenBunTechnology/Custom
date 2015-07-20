//
//  BBContactModel.m
//  UnNamed
//
//  Created by T on 15/7/17.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "BBContactModel.h"

@implementation BBContactModel
+(LKDBHelper *)getUsingLKDBHelper {
    static LKDBHelper* db;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *dbpath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"BBContactDatabase.sqlite"];
        db = [[LKDBHelper alloc] initWithDBPath:dbpath];
    });
    return db;
}

+(BOOL)dbWillInsert:(NSObject *)entity {
    return YES;
}

+(void)dbDidInserted:(NSObject *)entity result:(BOOL)result {
}

+(BOOL)isContainParent {
    return YES;
}

@end
