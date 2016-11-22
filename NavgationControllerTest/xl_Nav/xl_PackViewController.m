//
//  xl_PackViewController.m
//  NavgationControllerTest
//
//  Created by ddSoul on 16/11/22.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "xl_PackViewController.h"
#import "xl_packNavController.h"
#import "UIViewController+Category.h"

@interface xl_PackViewController ()

//传递过来包装了Vc的Nav
@property(nonatomic, strong)xl_packNavController *packNav;

@end

@implementation xl_PackViewController

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
-(xl_PackViewController *)packViewController:(UIViewController *)viewController
{
    xl_packNavController *packNav = [[xl_packNavController alloc] init];

    packNav.viewControllers = @[viewController];
    
    [self addChildViewController:packNav];
    
    self.packNav = packNav;

    return self;
}



@end
