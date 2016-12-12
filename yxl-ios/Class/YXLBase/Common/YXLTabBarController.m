//
//  YXLTabBarController.m
//  yxl-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLTabBarController.h"
#import "YXLNavigationController.h"
#import "HomeViewController.h"
#import "BusinessViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"

@interface YXLTabBarController ()

@end

@implementation YXLTabBarController

    
+ (void)initialize {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}
    
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarHidden = NO;

}

- (BOOL)shouldAutorotate {
    YXLNavigationController *nav = self.viewControllers[0];
    for (UIViewController *vc in nav.viewControllers) {
        if ([vc isKindOfClass:[HomeViewController class]]) {
            return YES;
        }
    }
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    YXLNavigationController *nav = self.viewControllers[0];
    for (UIViewController *vc in nav.viewControllers) {
        if ([vc isKindOfClass:[HomeViewController class]]) {
            return UIInterfaceOrientationMaskAllButUpsideDown;
        }
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}


    
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildViewController];
    
    
}

    
- (void)setUpChildViewController{
    // 首页
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self setupChildVc:homeVC title:@"首页" image:@"yxl_home" selectedImage:@"yxl_home_s"];
    
    // 生意
    BusinessViewController *discoverVC = [[BusinessViewController alloc] init];
    [self setupChildVc:discoverVC title:@"生意" image:@"yxl_shop" selectedImage:@"yxl_shop_s"];
    
    // 消息
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    [self setupChildVc:messageVC title:@"消息" image:@"yxl_message" selectedImage:@"yxl_message_s"];
    
    // 我的
    MineViewController *profileVC = [[MineViewController alloc] init];
    [self setupChildVc:profileVC title:@"我的" image:@"yxl_mine" selectedImage:@"yxl_mine_s"];
    
}
#pragma mark - 添加一个子控制器
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    if ([title isEqualToString:@"我的"]) {
        vc.navigationItem.title = @"";
    }else if ([title isEqualToString:@"首页"]){
        vc.navigationItem.title = @"银信联财富";
    }else if ([title isEqualToString:@"生意"]){
        vc.navigationItem.title = @"";
    }else{
        vc.navigationItem.title = title;
    }
    vc.tabBarItem.title = title;
    [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor SUN_ColorWithHexString:@"#D0005D" alpha:1],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    YXLNavigationController *nav = [[YXLNavigationController alloc] initWithRootViewController:vc];
    
    
    
    [self addChildViewController:nav];
}


    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
