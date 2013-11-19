//
//  ViewController.h
//  UIWebViewWithHeader
//
//  Created by isaced on 13-11-19.
//  Copyright (c) 2013年 isaced. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIWebViewWithHeader.h"

@interface ViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebViewWithHeader *webView;

@end
