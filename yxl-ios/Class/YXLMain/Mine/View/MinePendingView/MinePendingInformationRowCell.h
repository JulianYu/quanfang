//
//  MinePendingInformationRowCell.h
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MinePendingInformationRowCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pendingImageView;
@property (weak, nonatomic) IBOutlet UILabel *pendingInformationLabel;
@property (weak, nonatomic) IBOutlet UILabel *pendingPriceNumberLabel;

@end
