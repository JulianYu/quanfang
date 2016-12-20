//
//  SUNNumberChooseControl.h
//  yxl-ios
//
//  Created by mac on 16/12/20.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SUNNumberChooseControl : UIControl

@property (nonatomic, assign) NSInteger minNumber; //default 1;

@property (nonatomic, assign) NSInteger maxNumber;  //default NSUIntegerMax;

@property (nonatomic, assign) NSInteger currentValue;   //current value

@property (nonatomic, assign) UITextField *inputTextField;  //input field

@property (nonatomic, assign) UILabel   *leftTipLabel;      //buy count

@end
