//
//  BusinessBannerView.m
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessBannerView.h"
#define MAX_PAGE_COUNT 4
@implementation BusinessBannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self scrollView];
    }
    return self;
}
-(UIScrollView *)scrollView{
    if (!_scrollView)
    {
        self.scrollView                                = [[UIScrollView alloc] initWithFrame:self.frame];
        self.scrollView.backgroundColor                = [UIColor whiteColor];
        self.scrollView.pagingEnabled                  = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.bounces                        = NO;
        self.scrollView.delegate                       = self;
        [self.scrollView scrollRectToVisible:CGRectMake(0, 0, SCREEN_WIDTH, self.scrollView.frame.size.height) animated:NO];
        [self addSubview:self.scrollView];
        self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * MAX_PAGE_COUNT, self.scrollView.height);
        for (int i = 0; i < MAX_PAGE_COUNT ; i++) {
            UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, self.height)];
            [image setImage:[UIColor SUN_ImageWithColor:[UIColor randomColor]]];
            [self.scrollView addSubview:image];
        }
        self.pagecontrol.currentPage = 0;
        [self setupTimer];
        
        
    }
    return _scrollView;

}

-(UIPageControl *)pagecontrol{
    if (!_pagecontrol) {
        _pagecontrol = [[UIPageControl alloc]init];
        _pagecontrol.numberOfPages = MAX_PAGE_COUNT;
        CGSize size = [_pagecontrol sizeForNumberOfPages:MAX_PAGE_COUNT];
        
        _pagecontrol.bounds = CGRectMake(0, 0, size.width, size.height);
        _pagecontrol.center = CGPointMake(self.center.x, self.height-10);
        
        _pagecontrol.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pagecontrol.pageIndicatorTintColor = [UIColor grayColor];
        
        [self addSubview:_pagecontrol];
        
        [_pagecontrol addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _pagecontrol;
}


#pragma mark - ***** UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    self.pagecontrol.currentPage = page;
    
}

-(void)setupTimer{
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(timerChanged) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void)timerChanged{
    int page = (self.pagecontrol.currentPage +1) % MAX_PAGE_COUNT;
    self.pagecontrol.currentPage = page;
    [self pageChanged:self.pagecontrol];
}
-(void)pageChanged:(UIPageControl*)pageControl{
    CGFloat x = (pageControl.currentPage)*self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self setupTimer];
}



@end
