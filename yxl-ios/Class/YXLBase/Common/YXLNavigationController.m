//
//  YXLNavigationController.m
//  yxl-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLNavigationController.h"
#import "UIBarButtonItem+Item.h"
@interface YXLNavigationController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) id popDelegate;

@end

@implementation YXLNavigationController

+ (void)initialize {
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    
    
    [bar setBackgroundImage:[UIColor SUN_ImageWithColor:SUN_GlobalNormalColor] forBarMetrics:UIBarMetricsDefault];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:SUN_GlobalWhiteColor}];
    
}

    
- (void)viewDidLoad {
    [super viewDidLoad];
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.interactivePopGestureRecognizer.delegate = nil;
    self.delegate = self;

}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count) {
        // 不是根控制器
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem SUN_BarButtonItemWithImage:[UIImage imageNamed:@"yxl_nav_back"] highImage:[UIImage imageNamed:@"yxl_nav-back"] target:self action:@selector(backToPre) forControlEvents:UIControlEventTouchUpInside];
    }
    
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    
}
- (void)backToPre {
    [self popViewControllerAnimated:YES];
}
- (void)setNavigationBarHidden:(BOOL)navigationBarHidden {
    if (navigationBarHidden) {
        self.hidesBarsOnSwipe = YES;
    }
    else {
        self.hidesBarsOnSwipe = NO;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
