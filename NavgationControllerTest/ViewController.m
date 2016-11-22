//
//  ViewController.m
//  NavgationControllerTest
//
//  Created by ddSoul on 16/11/22.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "UIImage+Image.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forBarMetrics:UIBarMetricsDefault];
    
    //来个Button
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pushButton.frame = CGRectMake(0, 0, 100, 100);
    pushButton.center = self.view.center;
    pushButton.backgroundColor = [UIColor redColor];
    [pushButton setTitle:@"push" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)push
{
    NextViewController *push = [[NextViewController alloc] init];
    [self.navigationController pushViewController:push animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
