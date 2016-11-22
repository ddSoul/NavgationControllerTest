//
//  xl_PackViewController.h
//  NavgationControllerTest
//
//  Created by ddSoul on 16/11/22.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PackViewController : UIViewController

//对push过来的viewController进行包装，包装后变成带有Nav的控制器
-(PackViewController *)packViewController:(UIViewController *)viewController;

@end
