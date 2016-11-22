//
//  xl_PackViewController.m
//  NavgationControllerTest
//
//  Created by ddSoul on 16/11/22.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "PackViewController.h"
#import "PackNavController.h"
#import "UIViewController+Category.h"

@interface PackViewController ()

//传递过来包装了Vc的Nav
@property(nonatomic, strong)PackNavController *packNav;

@end

@implementation PackViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.packNav.view];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//包装过程
-(PackViewController *)packViewController:(UIViewController *)viewController
{
    PackNavController *packNav = [[PackNavController alloc] init];

    packNav.viewControllers = @[viewController];
    
    [self addChildViewController:packNav];
    
    self.packNav = packNav;

    return self;
}



@end
