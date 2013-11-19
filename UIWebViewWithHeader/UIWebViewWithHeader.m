//
//  UIWebViewWithHeader.m
//  UIWebViewWithHeader
//
//  Created by isaced on 13-11-19.
//  Copyright (c) 2013年 isaced. All rights reserved.
//

#import "UIWebViewWithHeader.h"

#define IOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0

@interface UIWebViewWithHeader()

@property (nonatomic, strong) UIView *webBrowserView;

@end

@implementation UIWebViewWithHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initWebView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initWebView];
    }
    return self;
}

- (void)initWebView{
    if (IOS7) {
        self.webBrowserView = self.scrollView.subviews.firstObject;
    }else{
        self.webBrowserView = self.scrollView.subviews.lastObject;
    }
}

- (void)setHeaderView:(UIView *)headerView
{
    _headerView = headerView;
    
    [self.scrollView addSubview:headerView];
    
    CGRect frame = self.webBrowserView.frame;
    frame.origin.y = CGRectGetMaxY(headerView.frame);
    self.webBrowserView.frame = frame;
}

- (void)setFooterView:(UIView *)footerView
{
    _footerView = footerView;
    self.delegate = self;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (self.footerView != nil) {
        [self addObserverForWebViewContentSize];
        
        //0.1s after setting position
        [self performSelector:@selector(layoutFooterView) withObject:nil afterDelay:0.1];
    }
}

-(void)layoutFooterView
{
    CGSize contentSize = self.scrollView.contentSize;
    CGFloat y = CGRectGetMaxY(self.webBrowserView.frame);
    self.footerView.frame = CGRectMake(0, y, contentSize.width, self.footerView.frame.size.height);
    self.scrollView.contentSize = CGSizeMake(contentSize.width, y + self.footerView.frame.size.height);
    [self.scrollView addSubview:_footerView];
}

- (void)addObserverForWebViewContentSize
{
    [self.scrollView addObserver:self forKeyPath:@"contentSize" options:0 context:NULL];
}
- (void)removeObserForWebViewContentSize
{
    [self.scrollView removeObserver:self forKeyPath:@"contentSize"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    // Remove Observer
    [self removeObserForWebViewContentSize];
    
    [self layoutFooterView];
    
    // Add Observer
    [self addObserverForWebViewContentSize];
}
@end
