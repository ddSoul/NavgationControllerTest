//
//  UIViewController+Category.m
//  NavgationControllerTest
//
//  Created by ddSoul on 16/11/22.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "UIViewController+Category.h"
#import <objc/runtime.h>

static char *KNav = "xl_navgationController";

@implementation UIViewController (Category)

- (void)setXl_navgationController:(XLNavgationController *)xl_navgationController
{
    objc_setAssociatedObject(self, &KNav, xl_navgationController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (XLNavgationController *)xl_navgationController
{
    return objc_getAssociatedObject(self, &KNav);
}

@end
