//
//  BBContact.m
//  UnNamed
//
//  Created by T on 15/7/17.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "BBContact.h"
#import "BBTel.h"

@implementation BBContact
+(LKDBHelper *)getUsingLKDBHelper {
    return [BBContactModel getUsingLKDBHelper];
}
+(NSString *)getTableName {
    return @"bbx_contact";
}
+(NSString *)getPrimaryKey {
    return @"id";
}
+(BOOL)autoIncreatPrimaryKey {
    return YES;
}
-(id)userGetValueForModel:(LKDBProperty *)property {
    return nil;
}
-(void)userSetValueForModel:(LKDBProperty *)property value:(id)value {
}
+(BOOL)dbWillDelete:(BBContact *)entity{
    for (BBTel *tel in entity.phoneNumbers) {
        [tel deleteToDB];
    }
    return YES;
}
+(void)dbDidInserted:(BBContact *)entity result:(BOOL)result {
    NSInteger contactId = entity.rowid;
    NSArray *phoneNumbers = nil;
    NSMutableArray *arrAttrs = [NSMutableArray array];
    if (entity.phoneNumbers.count!=0) {
        phoneNumbers = (NSArray *)entity.phoneNumbers;
        [arrAttrs addObject:phoneNumbers];
    }
    for (NSArray *arr in arrAttrs) {
        for (NSObject *obj in arr) {
            [obj setValue:@(contactId) forKeyPath:@"contactId"];
        }
    }
    [entity updateToDB];
}
@end
