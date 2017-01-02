//
//  MineGoldSilverTableView.h
//  yxl-ios
//
//  Created by mac on 16/12/30.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseTableView.h"

@interface MineGoldSilverTableView : YXLBaseTableView
<
UITableViewDelegate,
UITableViewDataSource
>
@property( nonatomic, assign) NSInteger         tag;
@end
