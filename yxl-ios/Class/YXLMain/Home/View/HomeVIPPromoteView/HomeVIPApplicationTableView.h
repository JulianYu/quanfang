//
//  HomeVIPApplicationTableView.h
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseTableView.h"
#import "HomeVIPRankLisTableView.h"
#import "HomeVIPApplyModel.h"

@interface HomeVIPApplicationTableView : YXLBaseTableView
<
UITableViewDelegate,
UITableViewDataSource,
SelectedRankDelegate
>
@property( nonatomic, copy) NSString        * rankStr;
@property( nonatomic, strong) HomeVIPApplyModel        * model;

@end
