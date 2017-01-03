//
//  BusinessBannerCell.m
//  yxl-ios
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessBannerCell.h"
#import "BusinessViewController.h"

//#define MAX_PAGE_COUNT 4

@interface BusinessBannerCell ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView                  *scrollView;
@property (nonatomic, strong) NSTimer                       *timer;
@property (nonatomic, strong) UIPageControl                 *pagecontrol;

@end
@implementation BusinessBannerCell{
    NSInteger count;
}

-(void)buildUI{
    [self scrollView];
}
-(void)updateDataBy:(BusinessBannerModel *)model{
    
    for (int i = 0; i < model.data.player.count ; i++) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, self.height)];
        NSString *url = [NSString stringWithFormat:@"%@/%@",[ServerConfig sharedServerConfig].url,[model.data.player objectAtIndex:i].img];
        [image sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"yxl_placeholder_image"]];
        [self.scrollView addSubview:image];
    }
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * model.data.player.count, self.scrollView.height);

    self.pagecontrol.numberOfPages = model.data.player.count;
    CGSize size = [_pagecontrol sizeForNumberOfPages:model.data.player.count];
    
    self.pagecontrol.bounds = CGRectMake(0, 0, size.width, size.height);
    self.pagecontrol.center = CGPointMake(self.center.x, self.height-10);
    count = model.data.player.count;
    [self setupTimer];


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
        self.pagecontrol.currentPage = 0;
        
        
    }
    return _scrollView;
    
}

-(UIPageControl *)pagecontrol{
    if (!_pagecontrol) {
        _pagecontrol = [[UIPageControl alloc]init];

        
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
    int page = (self.pagecontrol.currentPage +1) % (int)count;
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
//    [self setupTimer];
}


@end
