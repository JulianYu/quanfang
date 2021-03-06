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
        _collectionView.allowsSelection = NO;
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
        cell.data = [self.model.data objectAtIndex:indexPath.section -2];
        return cell;
    }
    else{
        BusinessRightItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:RIGHTROWCELL_IDENTIFIER forIndexPath:indexPath];
        if (!self.model.data.count) {
            return cell;
        }
        cell.headerGoods = [[self.model.data objectAtIndex:indexPath.section-2].goods objectAtIndex:1];
        cell.footerGoods = [[self.model.data objectAtIndex:indexPath.section-2].goods lastObject];
                
        return cell;
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
