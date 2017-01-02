//
//  Define.h
//  yxl-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#ifndef Define_h
#define Define_h

#import "UIDevice+Category.h"

#define SUN_TableRegisterCell(tableView, cell, cellId) [tableView registerNib:[UINib nibWithNibName:cell bundle:nil] forCellReuseIdentifier:cellId];
#define SUN_RegisterCell(cell, cellId) SUN_TableRegisterCell(self.tableView, cell, cellId)

//登录成功
#define UserStateChangeToLoginSuccess @"UserStateChangeToLoginSuccess"
//退出成功
#define UserStateChangeToLogoutSuccess @"UserStateChangeToLogoutSuccess"
//更改头像
#define UserInformationDidChangeSuccessByHeadIcon @"UserInformationDidChangeSuccessByHeadIcon"
//更改昵称
#define UserInformationDidChangeSuccessByNickname @"UserInformationDidChangeSuccessByNickname"


//加入购物车
#define ShopProductsJoinedCarSuccess @"ShopProductsJoinedCarSuccess"
//移除购买商品
#define ShopCartDidRemoveProductSuccess @"ShopCartDidRemoveProductSuccess"
//购买商品数量改变
#define ShopCartBuyProductNumberDidChange @"ShopCartBuyProductNumberDidChange"
//购物车商品价格改变
#define ShopCartBuyPriceDidChange @"ShopCartBuyPriceDidChange"

//购物车界面单个cell加载完毕
#define ShopCartItemCellDidLoadSuccess @"ShopCartItemCellDidLoadSuccess"


#endif /* Define_h */
