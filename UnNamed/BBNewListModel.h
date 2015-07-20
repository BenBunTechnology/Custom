//
//  BBNewListModel.h
//  UnNamed
//
//  Created by T on 15/7/15.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "CoreListCommonModel.h"

@interface BBNewListModel : CoreListCommonModel

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *url_3w;

@property (nonatomic, assign) NSInteger hasHead;

@property (nonatomic, assign) NSInteger hasImg;

@property (nonatomic, copy) NSString *lmodify;

@property (nonatomic, copy) NSString *docid;

//@property (nonatomic, copy) NSString *templateString;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, assign) NSInteger votecount;

@property (nonatomic, copy) NSString *pixel;

@property (nonatomic, assign) NSInteger hasCover;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *cid;

@property (nonatomic, assign) NSInteger hasAD;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, assign) NSInteger hasIcon;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *ename;

@property (nonatomic, copy) NSString *boardid;

@property (nonatomic, assign) NSInteger order;

@property (nonatomic, copy) NSString *digest;

@end
