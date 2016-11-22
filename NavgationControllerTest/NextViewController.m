//
//  NextViewController.m
//  NavgationControllerTest
//
//  Created by ddSoul on 16/11/22.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "NextViewController.h"
#import "ThirdViewController.h"
#import "UIImage+Image.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第二个页面";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor redColor]] forBarMetrics:UIBarMetricsDefault];
    
    //来个Button
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pushButton.frame = CGRectMake(0, 0, 100, 100);
    pushButton.center = self.view.center;
    pushButton.backgroundColor = [UIColor redColor];
    [pushButton setTitle:@"push" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    // Do any additional setup after loading the view.
}

- (void)push
{
    ThirdViewController *push = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:push animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
