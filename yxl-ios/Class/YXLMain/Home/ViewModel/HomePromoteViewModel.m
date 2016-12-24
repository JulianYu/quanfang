//
//  HomePromoteViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomePromoteViewModel.h"
#import "HomeVIPApplicationTableView.h"
@interface HomePromoteViewModel ()
@property( nonatomic, strong) HomeVIPApplicationTableView        * applicationTableView;
@end

@implementation HomePromoteViewModel

- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isMemberOfClass:NSClassFromString(@"HomeVIPApplicationViewController")]) {
            [viewController.view addSubview:self.applicationTableView];
        }
    }
    return self;
}

-(HomeVIPApplicationTableView *)applicationTableView{
    if (!_applicationTableView) {
        _applicationTableView = [[HomeVIPApplicationTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _applicationTableView;
}
@end
