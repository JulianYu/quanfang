//
//  ProductChooseView.m
//  yxl-ios
//
//  Created by mac on 16/12/26.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductChooseView.h"

@implementation ProductChooseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    self.backgroundColor = [UIColor clearColor];
    
    self.alphaView = [[UIView alloc]initWithFrame:self.bounds];
    self.alphaView.backgroundColor = [UIColor blackColor];
    self.alphaView.alpha = 0.2;
    [self addSubview:self.alphaView];
    
    self.whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, self.width, self.height-200)];
    self.whiteView.backgroundColor = SUN_GlobalWhiteColor;
    [self addSubview:self.whiteView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.whiteView addGestureRecognizer:tap];

    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, -20, 100, 100)];
    self.imageView.image = [UIColor SUN_ImageWithColor:[UIColor randomColor]];
    [self.imageView SUN_SetBordersWithColor:SUN_GlobalWhiteColor andCornerRadius:4 andWidth:5];
    [self.whiteView addSubview:self.imageView];
    
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelBtn.frame = CGRectMake(self.whiteView.width-40, 10, 30, 30);
    [self.cancelBtn setBackgroundImage:[UIColor SUN_ImageWithColor:[UIColor randomColor]] forState:UIControlStateNormal];
    [self.whiteView addSubview:self.cancelBtn];
    
    self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.imageView.right+20, 10, self.whiteView.width - self.imageView.right-40-40,20)];
    [self.priceLabel SUN_SetTitleWithColor:[UIColor redColor] FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
    [self.whiteView addSubview:self.priceLabel];
    
    self.stockLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.imageView.right+20, self.priceLabel.bottom, self.whiteView.width - self.imageView.right-40-40, 20)];
    [self.stockLabel SUN_SetTitleWithColor:SUN_GlobalTextBlackColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
    [self.whiteView addSubview:self.stockLabel];
    
    self.detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.imageView.right + 20, self.stockLabel.bottom, self.whiteView.width - self.imageView.right - 40 - 40, 40)];
    self.detailLabel.numberOfLines = 2;
    [self.detailLabel SUN_SetTitleWithColor:SUN_GlobalTextBlackColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
    [self.whiteView addSubview:self.detailLabel];
    
    self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.imageView.bottom + 20, self.whiteView.width, 0.5)];
    self.lineLabel.backgroundColor = SUN_GlobalBackgroundColor;
    [self.whiteView addSubview:self.lineLabel];
    
    self.checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.checkBtn.frame = CGRectMake(SCREEN_WIDTH/12, self.whiteView.height - 50, SCREEN_WIDTH*5/6, 40);
    [self.checkBtn setBackgroundColor:[UIColor redColor]];
    [self.checkBtn setTitleColor:SUN_GlobalWhiteColor forState:UIControlStateNormal];
    self.checkBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.checkBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.whiteView addSubview:self.checkBtn];
    
    
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.lineLabel.bottom, self.whiteView.width, self.checkBtn.y-self.lineLabel.bottom)];
    self.mainScrollView.showsHorizontalScrollIndicator = NO;
    self.mainScrollView.showsVerticalScrollIndicator = NO;
    [self.whiteView addSubview:self.mainScrollView];
    //购买数量的视图
    self.countView = [[ProductBuyCountView alloc] initWithFrame:CGRectMake(0, 0, self.width, 50)];
    [self.mainScrollView addSubview:self.countView];
    [self.countView.addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    self.countView.countTF.delegate = self;
    [self.countView.reduceBtn addTarget:self action:@selector(reduce) forControlEvents:UIControlEventTouchUpInside];

}


#pragma mark-typedelegete
-(void)btnIndex:(int)tag
{
    
}
//恢复按钮的原始状态
-(void)resumeBtn:(NSArray *)arr :(ProductTypeView *)view
{
    for (int i = 0; i< arr.count; i++) {
        UIButton *btn =(UIButton *) [view viewWithTag:100+i];
        btn.enabled = YES;
        btn.selected = NO;
        [btn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
        [btn setTitleColor:[UIColor blackColor] forState:0];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        if (view.selectIndex == i) {
            btn.selected = YES;
            [btn setBackgroundColor:[UIColor redColor]];
        }
    }
}


#pragma mark-数量加减
-(void)add
{
    int count =[self.countView.countTF.text intValue];
    if (count < self.stock) {
        self.countView.countTF.text = [NSString stringWithFormat:@"%d",count+1];
    }else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数量超出范围" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
}
-(void)reduce
{
    int count =[self.countView.countTF.text intValue];
    if (count > 1) {
        self.countView.countTF.text = [NSString stringWithFormat:@"%d",count-1];
    }else
    {
    }
}

#pragma mark-tf
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.mainScrollView.contentOffset = CGPointMake(0, self.countView.y);
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    int count =[self.countView.countTF.text intValue];
    if (count > self.stock) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数量超出范围" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.tag = 100;
        [alert show];
        self.countView.countTF.text = [NSString stringWithFormat:@"%d",self.stock];
        [self tap];
    }
}
-(void)tap
{
    self.mainScrollView.contentOffset = CGPointMake(0, 0);
    [self.countView.countTF resignFirstResponder];
}





@end
