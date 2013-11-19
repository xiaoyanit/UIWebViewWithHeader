//
//  ViewController.m
//  UIWebViewWithHeader
//
//  Created by isaced on 13-11-19.
//  Copyright (c) 2013年 isaced. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.isaced.com"]];
    [self.webView loadRequest:request];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    v.backgroundColor = [UIColor blueColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    v1.backgroundColor = [UIColor greenColor];
    
    [self.webView setHeaderView:v];
    [self.webView setFooterView:v1];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
