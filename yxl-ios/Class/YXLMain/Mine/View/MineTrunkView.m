//
//  MineTrunkView.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineTrunkView.h"
#import "MineModel.h"
#import "MineSecondRowCell.h"
#define FIRSTROWCELL_IDENTIFIER @"firstCell"
#define SECONDROWCELL_IDENTIFIER @"secondCell"
@interface MineTrunkView()<UITableViewDelegate,UITableViewDataSource>

@property( nonatomic, strong) UITableView        * tableView;
@property( nonatomic, strong) MineModel          * model;
@end

@implementation MineTrunkView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MineList" ofType:@"plist"];
    self.model = [MineModel mj_objectWithFile:plistPath];
    
    [self.tableView reloadData];
    
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.allowsSelection = NO;
        _tableView.tableFooterView = [UIView new];
        
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(-10, 0, 0, 0));
        }];
        
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.model.dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FIRSTROWCELL_IDENTIFIER];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:FIRSTROWCELL_IDENTIFIER];
        }
        cell.textLabel.text = self.model.dataArray[indexPath.section].title;
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.textColor = SUN_GlobalTextGreyColor;
        return cell;
    }
    else{
        MineSecondRowCell *cell = [tableView dequeueReusableCellWithIdentifier:SECONDROWCELL_IDENTIFIER];
        if (!cell) {
            cell = [[MineSecondRowCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SECONDROWCELL_IDENTIFIER];
        }
        for (UIButton * imageBtn in cell.imageArray) {
            if (imageBtn.tag == self.model.dataArray[indexPath.section].data.count) {
                break;
            }
            RowData *data = self.model.dataArray[indexPath.section].data[imageBtn.tag];
            
            [imageBtn setImage:[UIImage imageNamed:data.img] forState:UIControlStateNormal];
            imageBtn.contentMode = UIViewContentModeScaleAspectFit;
        }
        for (UILabel *label in cell.labelArray) {
            if (label.tag == self.model.dataArray[indexPath.section].data.count) {
                break;
            }
            RowData *data = self.model.dataArray[indexPath.section].data[label.tag];
            label.textColor = SUN_GlobalTextGreyColor;
            label.text = data.text;
        }
        
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 34;
    }
    return (SCREEN_HEIGHT-34-10)/8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 10;
}


@end
