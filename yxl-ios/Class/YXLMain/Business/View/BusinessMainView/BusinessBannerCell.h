//
//  BusinessBannerCell.h
//  yxl-ios
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessBannerModel.h"
@interface BusinessBannerCell : UICollectionViewCell
-(void)buildUI;
-(void)updateDataBy:(BusinessBannerModel*)model;
@end
