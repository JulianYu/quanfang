//
//  HomeVIPApplicationTableView.h
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseTableView.h"

@interface HomeVIPApplicationTableView : YXLBaseTableView
<
UITableViewDelegate,
UITableViewDataSource
>
@property( nonatomic, copy) NSString        * rankStr;

@end
