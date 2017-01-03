//
//  BusinessTrunkView.h
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseView.h"
#import "BusinessHomeProductsModel.h"
@interface BusinessTrunkView : YXLBaseView
@property( nonatomic, strong) BusinessHomeProductsModel        * model;
@property( nonatomic, strong) UICollectionView        * collectionView;

@end
