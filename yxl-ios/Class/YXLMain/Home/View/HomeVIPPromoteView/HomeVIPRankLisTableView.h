//
//  HomeVIPRankLisTableView.h
//  yxl-ios
//
//  Created by mac on 16/12/29.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseTableView.h"
#import "HomeVIPRankListModel.h"
@interface HomeVIPRankLisTableView : YXLBaseTableView
<
UITableViewDelegate,
UITableViewDataSource
>
@property( nonatomic, strong) HomeVIPRankListModel        * model;
@end
