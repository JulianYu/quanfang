//
//  FunctionRowCell.h
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunctionRowCell : UITableViewCell
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageArray;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labelArray;

@end
