//
//  xl_NavgationController.m
//  NavgationControllerTest
//
//  Created by ddSoul on 16/11/22.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "XLNavgationController.h"
#import "UIViewController+Category.h"
#import "PackViewController.h"

@interface XLNavgationController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *xl_popGestureRecognizer;

@end

@implementation XLNavgationController

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        rootViewController.xl_navgationController = self;
        self.viewControllers = @[[[[PackViewController alloc] init] packViewController:rootViewController]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //需要隐藏xl_nav的导航栏
    [self setNavigationBarHidden:YES];
    
    if (![self.interactivePopGestureRecognizer.view.gestureRecognizers containsObject:self.xl_popGestureRecognizer]) {
        
        [self.interactivePopGestureRecognizer.view addGestureRecognizer:self.xl_popGestureRecognizer];
        
        // 用自己的手势替换系统的pop
        NSArray *targets = [self.interactivePopGestureRecognizer valueForKey:@"targets"];
        id target = [targets.firstObject valueForKey:@"target"];
        SEL action = NSSelectorFromString(@"handleNavigationTransition:");
        [self.xl_popGestureRecognizer addTarget:target action:action];
    
        // 系统手势置为不可用
        self.interactivePopGestureRecognizer.enabled = NO;
    }


    // Do any additional setup after loading the view.
}

// 自定义的pop手势
-(UIPanGestureRecognizer *)xl_popGestureRecognizer{
    if (!_xl_popGestureRecognizer) {
        _xl_popGestureRecognizer = [UIPanGestureRecognizer new];
        _xl_popGestureRecognizer.maximumNumberOfTouches = 1;
        _xl_popGestureRecognizer.delegate = self;
    }
    return _xl_popGestureRecognizer;
}

//gestureRecognizer 代理方法，用来解决第一个页面不可以Pop
-(BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer{
    
    // 根控制器不允许pop,会出现错误
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
