//
//  ThirdViewController.m
//  NavgationControllerTest
//
//  Created by ddSoul on 16/11/22.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIImage+Image.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第三个页面哦";
    
    [self setCustomNav];
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

- (void)leftBarBtnClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
