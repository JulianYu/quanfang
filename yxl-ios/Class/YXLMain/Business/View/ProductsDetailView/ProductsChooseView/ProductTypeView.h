//
//  ProductTypeView.h
//  yxl-ios
//
//  Created by mac on 16/12/26.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseView.h"
@protocol TypeSelectDelegate <NSObject>

-(void)btnIndex:(int)tag;

@end

@interface ProductTypeView : YXLBaseView
@property( nonatomic, assign) float         height;
@property( nonatomic, assign) int           selectIndex;
@property( nonatomic, weak) id<TypeSelectDelegate> delegate;

-(instancetype)initWithFrame:(CGRect)frame andDataSource:(NSArray*)arr :(NSString*)typename;

@end
