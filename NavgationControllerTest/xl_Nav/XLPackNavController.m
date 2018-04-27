//
//  XLPackNavController.m
//  NavgationControllerTest
//
//  Created by ddSoul on 16/11/22.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "XLPackNavController.h"
#import "UIViewController+Category.h"
#import "XLNavgationController.h"
#import "XLPackViewController.h"

@interface XLPackNavController ()

@end

@implementation XLPackNavController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    // 注意, 这里压入的是一个包装过后的控制器
    XLPackViewController *packViewController = [[XLPackViewController new] packViewController:viewController];
    [self.navigationController pushViewController:packViewController animated:animated];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    return [self.navigationController popViewControllerAnimated:animated];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
