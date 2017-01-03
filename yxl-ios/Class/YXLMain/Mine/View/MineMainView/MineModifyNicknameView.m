//
//  MineModifyNicknameView.m
//  yxl-ios
//
//  Created by mac on 16/12/30.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineModifyNicknameView.h"
#import "MineModifyNickNameViewController.h"
@interface MineModifyNicknameView ()<UITextViewDelegate>
@property (nonatomic, copy) NSString *str;
@property(nonatomic,strong) UILabel *textNumberLabel;

@end
@implementation MineModifyNicknameView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    
    UIButton *checkBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    [checkBtn setBackgroundColor:[UIColor colorWithRed:121.0/255 green:195.0/255 blue:0 alpha:1]];
    checkBtn.layer.cornerRadius = 5;
    checkBtn.clipsToBounds = YES;
    [checkBtn setTintColor:[UIColor whiteColor]];
    [checkBtn setTitle:@"确 认" forState:UIControlStateNormal];
    [checkBtn addTarget:self action:@selector(check:) forControlEvents:UIControlEventTouchUpInside];

    
    UITextView *nickname = [[UITextView alloc]initWithFrame:CGRectZero];
    nickname.text = [UserModel sharedUserModel].user.nickname;
    nickname.textColor = [UIColor lightGrayColor];
    nickname.backgroundColor = [UIColor whiteColor];
    nickname.font = [UIFont systemFontOfSize:16];
    nickname.layer.cornerRadius = 2;
    nickname.keyboardType = UIKeyboardTypeDefault;
    nickname.delegate = self;
    
    
    self.textNumberLabel = [[UILabel alloc]init];
    self.textNumberLabel.textAlignment = NSTextAlignmentRight;
    self.textNumberLabel.font = [UIFont boldSystemFontOfSize:12];
    self.textNumberLabel.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
    self.textNumberLabel.backgroundColor = [UIColor whiteColor];
    self.textNumberLabel.text = [NSString stringWithFormat:@"0/8"];
    
    [self addSubview:checkBtn];
    [self addSubview:self.textNumberLabel];
    [self addSubview:nickname];
    
    
    [nickname mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(40);
    }];
    
    
    [checkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(nickname.mas_bottom).offset(20);
        make.width.mas_equalTo(nickname.mas_width);
        make.height.mas_equalTo(40);
    }];

    //文字个数提示Label
    [self.textNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nickname.mas_right).offset(-60);
        make.top.bottom.mas_equalTo(nickname);
        make.width.mas_equalTo(40);
    }];
//    self.textNumberLabel.frame = CGRectMake(nickname.right-60, nickname.y, 40, 40);
    [self bringSubviewToFront:self.textNumberLabel];


}
-(void)check:(UIButton *)sender{
    if (self.str.length>8) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"昵称长度超过8" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
        }];
        [alertController addAction:cancel];
        [[self SUN_GetCurrentViewController] presentViewController:alertController animated:YES completion:nil];
    }
    else{
        [((MineModifyNickNameViewController*)[self SUN_GetCurrentViewController]).viewModel modifyUserInformationByHead_ico:nil nickname:self.str sex:nil CompletionHandle:^(id model, id error) {
            [[self SUN_GetCurrentNavigationController] popViewControllerAnimated:YES];
        }];
    }
}
-(void)valueChange:(UITextField*)textField{
    
//    NSLog(@"当前输入框文字个数:%lu",textField.text.length);
    
    self.str = textField.text;
}


-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
    if ([textView.text isEqualToString:[UserModel sharedUserModel].user.nickname]) {
        textView.text = @"";
        textView.textColor = [UIColor darkGrayColor];
    }
    
    return  YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    [textView setTextColor:[UIColor blackColor]];
    
    
    //当前输入字数
    _textNumberLabel.text = [NSString stringWithFormat:@"%lu/8",(unsigned long)textView.text.length];
    if (textView.text.length > 8) {
        _textNumberLabel.textColor = [UIColor redColor];
    }else{
        _textNumberLabel.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
    }
    
    return YES;
}

//文本框每次输入文字都会调用  -> 更改文字个数提示框
- (void)textViewDidChangeSelection:(UITextView *)textView{
    
    _textNumberLabel.text = [NSString stringWithFormat:@"%lu/8",(unsigned long)textView.text.length];
    if (textView.text.length > 8) {
        _textNumberLabel.textColor = [UIColor redColor];
    }
    else{
        _textNumberLabel.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
    }
}



-(void)textViewDidChange:(UITextView *)textView{
    self.str = textView.text;
}

@end
