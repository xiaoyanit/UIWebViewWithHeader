//
//  UIWebViewWithHeader.h
//  UIWebViewWithHeader
//
//  Created by isaced on 13-11-19.
//  Copyright (c) 2013年 isaced. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebViewWithHeader : UIWebView <UIWebViewDelegate>

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;

@end
