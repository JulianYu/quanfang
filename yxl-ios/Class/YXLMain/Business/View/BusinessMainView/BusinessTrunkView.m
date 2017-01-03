//
//  BusinessTrunkView.m
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessTrunkView.h"
#import "BusinessLeftItemCell.h"
#import "BusinessRightItemCell.h"
#import "BusinessBannerCell.h"
#import "BusinessGridListCell.h"
#import "BusinessProductsListViewController.h"
#import "BusinessViewController.h"
#define BANNERROWCELL_IDENTIFIER @"bannercell"
#define GRIDLISTROWCELL_IDENTIFIER @"gridcell"
#define LEFTROWCELL_IDENTIFIER @"leftcell"
#define RIGHTROWCELL_IDENTIFIER @"rightcell"
@interface BusinessTrunkView ()
<
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout
>
@property (nonatomic, strong) UICollectionViewFlowLayout  *flowLayout;
@end
@implementation BusinessTrunkView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    [self collectionView];
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.minimumInteritemSpacing =1;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
        
        _collectionView.backgroundColor = [UIColor clearColor];
        [self addSubview:_collectionView];
        
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, 0, 0));
        }];
        [_collectionView layoutIfNeeded];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[BusinessBannerCell class] forCellWithReuseIdentifier:BANNERROWCELL_IDENTIFIER];
        
        [_collectionView registerClass:[BusinessGridListCell class] forCellWithReuseIdentifier:GRIDLISTROWCELL_IDENTIFIER];

        [_collectionView registerNib:[UINib nibWithNibName:@"BusinessLeftItemCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:LEFTROWCELL_IDENTIFIER];

        [_collectionView registerNib:[UINib nibWithNibName:@"BusinessRightItemCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:RIGHTROWCELL_IDENTIFIER];
    }
    return _collectionView;

}
#pragma mark - ***** UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2+self.model.data.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 1;
    }
    
    return 2;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        BusinessBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:BANNERROWCELL_IDENTIFIER forIndexPath:indexPath];
        [cell buildUI];
        [((BusinessViewController*)[self SUN_GetCurrentViewController]).viewModel setUpBannerDataBy:cell];
        
        return cell;
    }
    else if (indexPath.section == 1){
        BusinessGridListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:GRIDLISTROWCELL_IDENTIFIER forIndexPath:indexPath];
        [cell buildUI];
        return cell;
    }
    
    if (indexPath.row == 0) {
        BusinessLeftItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LEFTROWCELL_IDENTIFIER forIndexPath:indexPath];
        cell.productNameLabel.text = [self.model.data objectAtIndex:indexPath.section-2].name;
        
        NSString *url = [NSString stringWithFormat:@"%@/%@",[ServerConfig sharedServerConfig].url,[[self.model.data objectAtIndex:indexPath.section-2].goods firstObject].img];
        
        [cell.productImageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"yxl_placeholder_image"]];
        return cell;
    }
    else{
        BusinessRightItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:RIGHTROWCELL_IDENTIFIER forIndexPath:indexPath];
        if (!self.model.data.count) {
            return cell;
        }
        NSString *headerUrl = [NSString stringWithFormat:@"%@/%@",[ServerConfig sharedServerConfig].url,[[self.model.data objectAtIndex:indexPath.section-2].goods objectAtIndex:1].img];
        NSString *footerUrl = [NSString stringWithFormat:@"%@/%@",[ServerConfig sharedServerConfig].url,[[self.model.data objectAtIndex:indexPath.section-2].goods lastObject].img];
        cell.productHeaderNameLabel.text = [[self.model.data objectAtIndex:indexPath.section-2].goods objectAtIndex:1].name;
        cell.productFooterNameLabel.text = [[self.model.data objectAtIndex:indexPath.section-2].goods lastObject].name;
        [cell.productHeaderBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:headerUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"yxl_placeholder_image"]];
        [cell.productFooterBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:footerUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"yxl_placeholder_image"]];
        cell.productHeaderPriceLabel.text = [[self.model.data objectAtIndex:indexPath.section-2].goods objectAtIndex:1].sell_price;
        cell.productFooterPriceLabel.text = [[self.model.data objectAtIndex:indexPath.section-2].goods lastObject].sell_price;
        
        return cell;
    }
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section >1) {
        BusinessProductsListViewController *vc = [BusinessProductsListViewController new];
        vc.indexpath = indexPath;
        [[self SUN_GetCurrentViewController].navigationController pushViewController:vc animated:YES];
    }
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusable = nil;
    if (kind == UICollectionElementKindSectionHeader){
    }
    return reusable;
}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0){
    

    
    if (indexPath.section == 1 || indexPath.section == 0) {
    }
    else{
        if (indexPath.row % 2 != 0){
            cell.transform = CGAffineTransformTranslate(cell.transform, SCREEN_WIDTH/2,0);
        }
        else{
            cell.transform = CGAffineTransformTranslate(cell.transform, -SCREEN_WIDTH/2, 0);
        }
        cell.alpha = 0.0;
    
        [UIView animateWithDuration:0.5 animations:^{
    
            cell.transform = CGAffineTransformIdentity;
    
            cell.alpha = 1.0;
            
        } completion:^(BOOL finished) {
        }];
    }
    
}

#pragma mark - ***** UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 1 || section == 0) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return UIEdgeInsetsMake(5, 0, 5, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 || indexPath.section == 1) {
        return CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT/5);
    }
    
    return CGSizeMake((SCREEN_WIDTH-1)/2, SCREEN_WIDTH/2 + 30);
}


@end
