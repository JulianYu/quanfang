//
//  HomePromoteViewModel.h
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseViewModel.h"
#import "HomeVIPApplicationTableView.h"

@interface HomePromoteViewModel : YXLBaseViewModel
@property( nonatomic, strong) HomeVIPApplicationTableView           * applicationTableView;
-(void)reloadData;
@end
