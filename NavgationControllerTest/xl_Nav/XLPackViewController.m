//
//  XLPackViewController.m
//  NavgationControllerTest
//
//  Created by ddSoul on 16/11/22.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "XLPackViewController.h"
#import "XLPackNavController.h"
#import "UIViewController+Category.h"

@interface XLPackViewController ()

/* 传递过来包装了Vc的Nav */
@property(nonatomic, strong) XLPackNavController *packNav;

@end

@implementation XLPackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.packNav.view];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - public Metheds
- (XLPackViewController *)packViewController:(UIViewController *)viewController {
    
    XLPackNavController *packNav = [[XLPackNavController alloc] init];
    packNav.viewControllers = @[viewController];
    [self addChildViewController:packNav];
    self.packNav = packNav;
    
    return self;
}



@end
