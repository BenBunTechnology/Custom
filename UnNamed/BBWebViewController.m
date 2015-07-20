

//
//  BBWebViewController.m
//  UnNamed
//
//  Created by T on 15/7/15.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "BBWebViewController.h"

@interface BBWebViewController ()<UIWebViewDelegate>

@end

@implementation BBWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:webView];
    
    webView.delegate = self;
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
}

@end
