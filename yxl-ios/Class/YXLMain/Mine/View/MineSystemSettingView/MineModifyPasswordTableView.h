//
//  MineModifyPasswordTableView.h
//  yxl-ios
//
//  Created by mac on 16/12/22.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseTableView.h"
#import "MineModifyPasswordModel.h"

@interface MineModifyPasswordTableView : YXLBaseTableView
<
UITableViewDelegate,
UITableViewDataSource
>
@property( nonatomic, strong) MineModifyPasswordModel        * model;
@end
