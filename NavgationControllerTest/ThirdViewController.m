//
//  ThirdViewController.m
//  NavgationControllerTest
//
//  Created by ddSoul on 16/11/22.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIImage+Image.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ThirdViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *webView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第三个页面哦";
    
    [self setCustomNav];
    [self loadLocationHtml];
    // Do any additional setup after loading the view.
}

- (void)setCustomNav
{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
}

- (void)loadLocationHtml
{
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"index"
                                                          ofType:@"html"];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    [self.webView loadHTMLString:htmlCont baseURL:baseURL];
    [self.view addSubview:self.webView];

}

#pragma mark webviewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //判断是否是单击
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
    {
        NSURL *url = [request URL];
        
        NSString *str = [NSString stringWithFormat:@"%@",url];
        if ([str rangeOfString:@"www.hhhhh.com"].location != NSNotFound) {
            
            //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
            JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
            NSString *alertJS=@"alert('强哥威武，哈哈哈')"; //准备执行的js代码
            [context evaluateScript:alertJS];//通过oc方法调用js的alert
            
        }
        if ([str rangeOfString:@"wwwww"].location != NSNotFound) {
            
            //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
            JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
 
            context[@"test"] = ^() {
                NSArray *args = [JSContext currentArguments];
                for (id obj in args) {
                    NSString *str = [NSString stringWithFormat:@"%@",obj];
                    if ([str isEqualToString:@"pop"]) {
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                }
            };
            
                        NSString *jsFunctStr=@"test('pop')";
                        [context evaluateScript:jsFunctStr];
            
        }

        
        
        return NO;
    }
    return YES;
}

- (void)leftBarBtnClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        _webView.delegate = self;
    }
    return _webView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
