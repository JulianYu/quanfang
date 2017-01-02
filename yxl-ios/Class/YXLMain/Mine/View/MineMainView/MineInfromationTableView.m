//
//  MineInfromationTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/22.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineInfromationTableView.h"
#import "MineModifyNickNameViewController.h"
#import "MineModifySexViewController.h"
#import "MineDetailViewController.h"

@interface MineInfromationTableView ()
@property(nonatomic,assign)BOOL isChangePicture;
@property(nonatomic,strong)UIImageView *headImageView;

@end
@implementation MineInfromationTableView
-(UIImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView=[UIImageView new];
    }
    return _headImageView;
}


-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else{
        return 2;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }
    else{
        return 44;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personalCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"personalCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"头像";
        
        if (self.isChangePicture==NO) {
            NSString *url = [NSString stringWithFormat:@"%@/%@",[ServerConfig sharedServerConfig].url,[UserModel sharedUserModel].user.head_ico];
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:url]];
        }else
        {
            cell.imageView.image=self.headImageView.image;
        }
        
        [cell.imageView SUN_SetCornerRadius:20];
        [cell.textLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(cell.contentView).mas_offset(15);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(80);
        }];
        [cell.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(cell.contentView).mas_offset(-10);
            make.width.height.mas_equalTo(40);
            make.centerY.mas_equalTo(cell.contentView);
        }];
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"昵称";
        }
        else{
            cell.textLabel.text = @"性别";
        }
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        [self headerImagebuttonAction];
    }
    else{
        if (indexPath.row == 0) {
            MineModifyNickNameViewController *vc = [MineModifyNickNameViewController new];
            vc.title = @"昵称";
            [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
        }
        else{
            MineModifySexViewController *vc = [MineModifySexViewController new];
            vc.title = @"性别";
            [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
        }
    }
}

- (void)headerImagebuttonAction{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"拍照"
                                                     style:UIAlertActionStyleDestructive
                                                   handler:^(UIAlertAction *action) {
                                                       [self opencamera];
                                                   }];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"我的相册"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction *action) {
                                                      [self openPhoto];
                                                  }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction *action) {
                                                       
                                                   }];
    [alertController addAction:camera];
    [alertController addAction:photo];
    [alertController addAction:cancel];
    
    [[self SUN_GetCurrentNavigationController] presentViewController:alertController animated:YES completion:nil];
}
//照相机
- (void)opencamera{
    
    BOOL isAvailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    if (isAvailable){
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[@"public.image"];
        imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        imagePicker.allowsEditing = YES;
        imagePicker.delegate = self;
        
        [[self SUN_GetCurrentNavigationController] presentViewController:imagePicker animated:YES completion:nil];
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"
                                                                                 message:@"当前照相机不可用"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定"
                                                         style:UIAlertActionStyleCancel
                                                       handler:^(UIAlertAction *action) {
                                                           
                                                       }];
        [alertController addAction:cancel];
        [[self SUN_GetCurrentNavigationController] presentViewController:alertController animated:YES completion:nil];
        
    }
    
    
}
-(void)openPhoto
{
    BOOL isAvailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
    if (isAvailable){
        UIImagePickerController *imgePick = [[UIImagePickerController alloc] init];
        imgePick.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imgePick.allowsEditing = YES;
        imgePick.delegate = self;
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        [[self SUN_GetCurrentNavigationController] presentViewController:imgePick animated:YES completion:nil];
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"
                                                                                 message:@"当前相册"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定"
                                                         style:UIAlertActionStyleCancel
                                                       handler:^(UIAlertAction *action) {
                                                           
                                                       }];
        [alertController addAction:cancel];
        [[self SUN_GetCurrentNavigationController] presentViewController:alertController animated:YES completion:nil];
        
    }
    
    
}


//无论是相机，相册都会同一个方法返回图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    
    UIImage *scaleImage = [self scaleImage:image toScale:0.5];
    
    [self.headImageView setImage:scaleImage];
    self.isChangePicture=YES;
    [self upDateAndSave];
    
    //一定要刷新一下tableview；
    [self reloadData];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}
// 对图片尺寸进行压缩
-(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

-(void)upDateAndSave{
    
    [((MineDetailViewController*)[self SUN_GetCurrentViewController]).viewModel uploadAvatarImage:@[self.headImageView.image]];
    
}


@end
