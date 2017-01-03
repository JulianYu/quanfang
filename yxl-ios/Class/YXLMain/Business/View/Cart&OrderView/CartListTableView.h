//
//  CartListTableView.h
//  yxl-ios
//
//  Created by mac on 16/12/26.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseTableView.h"

@interface CartListTableView : YXLBaseTableView
<
UITableViewDataSource,
UITableViewDelegate
>
@property( nonatomic, copy) NSString        * model;

@end
