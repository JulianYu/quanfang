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

#endif /* Define_h */
