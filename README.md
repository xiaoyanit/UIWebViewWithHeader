UIWebViewWithHeader
===================

A subclass of UIWebView, you can add a HeaderView and FooterView

Usage
---
---
```
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    v.backgroundColor = [UIColor blueColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    v1.backgroundColor = [UIColor greenColor];
    
    [self.webView setHeaderView:v];
    [self.webView setFooterView:v1];
```