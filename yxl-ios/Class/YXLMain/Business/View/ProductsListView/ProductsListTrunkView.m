//
//  ProductsListTrunkView.m
//  yxl-ios
//
//  Created by mac on 16/12/16.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductsListTrunkView.h"
#import "ProductItemCollectionViewCell.h"
#import "ProductsDetailTrunkView.h"
#import "BusinessProductsDetailViewController.h"
#define PRODUCTROW_COLLECTIONVIEWCELL @"productItemCell"
#define BUTTON_HEIGHT 44
#define BUTTON_WIDTH SCREEN_WIDTH/3
@interface ProductsListTrunkView()
<
UIScrollViewDelegate,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>
@property( nonatomic, strong) UIScrollView                  * scrollView;
@property (nonatomic, strong) UICollectionViewFlowLayout    * flowLayout;
@property( nonatomic, strong) NSMutableArray<UIButton*>     * btnArray;

@end
@implementation ProductsListTrunkView
-(NSMutableArray<UIButton *> *)btnArray{
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    for (int i = 0; i<3; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*BUTTON_WIDTH, 0, BUTTON_WIDTH, BUTTON_HEIGHT)];
        btn.tag = i;
        switch (i) {
            case 0:
                [btn setTitle:@"人气排行" forState:UIControlStateNormal];
                break;
            case 1:
                [btn setTitle:@"最贵" forState:UIControlStateNormal];
                break;
            case 2:
                [btn setTitle:@"最便宜" forState:UIControlStateNormal];
                [btn setSelected:YES];

                break;
                
            default:
                break;
        }
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:SUN_GlobalTextGreyColor forState:UIControlStateNormal];
        [btn setTitleColor:SUN_GlobalNormalColor forState:UIControlStateSelected];
        [btn setBackgroundColor:SUN_GlobalWhiteColor];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnArray addObject:btn];
        [self addSubview:btn];
    }
    
    [self addSubview:self.scrollView];
}
-(void)btnClick:(UIButton*)sender{
    for (UIButton *btn  in self.btnArray) {
        [btn setSelected:NO];
    }
    [sender setSelected:YES];
    
    [self.scrollView setContentOffset:CGPointMake(sender.tag*SCREEN_WIDTH, 0) animated:YES];
}
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, BUTTON_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-BUTTON_HEIGHT)];
        _scrollView.contentSize = CGSizeMake(3*SCREEN_WIDTH, 0);
        [_scrollView setContentOffset:CGPointMake(2*SCREEN_WIDTH, 0)];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        
        for (int i = 0 ; i<3; i++) {
            self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
            self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
            UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, _scrollView.height)collectionViewLayout:self.flowLayout];
            collectionView.backgroundColor = [UIColor clearColor];
            [_scrollView addSubview:collectionView];
            collectionView.showsVerticalScrollIndicator = NO;
            collectionView.showsHorizontalScrollIndicator = NO;
            collectionView.dataSource = self;
            collectionView.delegate = self;
            
            [collectionView registerNib:[UINib nibWithNibName:@"ProductItemCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:PRODUCTROW_COLLECTIONVIEWCELL];
        }
    }
    return _scrollView;
}
#pragma mark - ***** UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 8;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PRODUCTROW_COLLECTIONVIEWCELL forIndexPath:indexPath];
    cell.backgroundColor = SUN_GlobalWhiteColor;
    return cell;
    
}
#pragma mark - ***** UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 0, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH - 30)/2, SCREEN_WIDTH/2 + 30);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BusinessProductsDetailViewController *vc = [BusinessProductsDetailViewController new];
    
    [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y == 0) {
        if (scrollView.contentOffset.x == SCREEN_WIDTH) {
            for (UIButton *btn in self.btnArray) {
                [btn setSelected:NO];
                if (btn.tag == 1) {
                    [btn setSelected:YES];
                }
                
            }
        }
        if (scrollView.contentOffset.x == 0) {
            for (UIButton *btn in self.btnArray) {
                [btn setSelected:NO];
                if (btn.tag == 0) {
                    [btn setSelected:YES];
                }
            }
            
        }
        if (scrollView.contentOffset.x == 2*SCREEN_WIDTH) {
            for (UIButton *btn in self.btnArray) {
                [btn setSelected:NO];
                if (btn.tag == 2) {
                    [btn setSelected:YES];
                }
            }
            
        }
    }
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    cell.alpha=0.5;
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    [UIView animateWithDuration:.25 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
        cell.alpha=1;
    }];


}


@end
