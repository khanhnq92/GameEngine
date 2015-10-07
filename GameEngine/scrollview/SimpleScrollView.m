//
//  SimpleScrollView.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/6/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import "SimpleScrollView.h"
#define Photo_width 320
#define Photo_height 480
#define numberPhoto 6
#define Zoom_step 1.5

@interface SimpleScrollView ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property(strong,nonatomic)UIScrollView* scrView;
@property(strong,nonatomic)UIPageControl* pageControl;
@property(strong,nonatomic)UILabel* lblScale;
@end

@implementation SimpleScrollView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    
    CGRect sizeFrame=self.view.frame;
    _scrView=[[UIScrollView alloc] initWithFrame:CGRectMake((sizeFrame.size.width-Photo_width)*0.5, 0, Photo_width, Photo_height)];
    _scrView.contentSize=CGSizeMake(Photo_width*numberPhoto, Photo_height);
    _scrView.pagingEnabled=true;
    _scrView.delegate=self;
    
    for (int i=1; i<numberPhoto+1; i++) {
        UIImage* img=[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
        UIImageView *imgView=[[UIImageView alloc] initWithImage:img];
        imgView.frame=CGRectMake(0, 0, Photo_width, Photo_height);

        
        imgView.userInteractionEnabled=true;
        imgView.multipleTouchEnabled=true;
        
        UITapGestureRecognizer* singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onSingleTap:)];
        singleTap.numberOfTapsRequired=1;
        singleTap.delegate=self;
        [imgView addGestureRecognizer:singleTap];
        
        
        UITapGestureRecognizer* doubleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onDoubleTap:)];
        doubleTap.numberOfTapsRequired=2;
        doubleTap.delegate=self;
        [imgView addGestureRecognizer:doubleTap];
        
        [singleTap requireGestureRecognizerToFail:doubleTap];
    
        UIScrollView* scrItem=[[UIScrollView alloc] initWithFrame:CGRectMake(Photo_width*(i-1), 0, Photo_width, Photo_height)];
        scrItem.contentSize=CGSizeMake(Photo_width, Photo_height);
        scrItem.maximumZoomScale=5.0;
        scrItem.minimumZoomScale=0.2;
        scrItem.delegate=self;

        
        [scrItem addSubview:imgView];
        [_scrView addSubview:scrItem];
    }
    
    [self.view addSubview:_scrView];
    
    _pageControl=[[UIPageControl alloc] initWithFrame:CGRectMake(0, sizeFrame.size.height-40-64,sizeFrame.size.width, 40)];
    _pageControl.numberOfPages=numberPhoto;
    _pageControl.backgroundColor=[UIColor grayColor];
    [_pageControl addTarget:self  action:@selector(pageControlChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
    
    
    _lblScale=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 25)];
    _lblScale.textAlignment=NSTextAlignmentRight;
    _lblScale.text=[NSString stringWithFormat:@"%2.1f",_scrView.zoomScale];
    
    UIBarButtonItem* item=[[UIBarButtonItem alloc] initWithCustomView:_lblScale];
    [self.navigationItem setRightBarButtonItem:item];
}
-(void)onSingleTap:(UITapGestureRecognizer*)sender{
    int pageIndex=_scrView.contentOffset.x/Photo_width;
    UIScrollView* scrItem=_scrView.subviews[pageIndex];
    UIImageView* imgItem=scrItem.subviews[0];
    
    CGPoint tapPoint=[sender locationInView:imgItem];
    float newScale=_scrView.zoomScale*Zoom_step;
    [self zoomRectForScale:newScale withCenter:tapPoint];
}
-(void)onDoubleTap:(id)sender{
    int pageIndex=_scrView.contentOffset.x/Photo_width;
    UIScrollView* scrItem=_scrView.subviews[pageIndex];
    UIImageView* imgItem=scrItem.subviews[0];
    
    CGPoint tapPoint=[sender locationInView:imgItem];
    float newScale=_scrView.zoomScale/Zoom_step;
    [self zoomRectForScale:newScale withCenter:tapPoint];
}
- (void)zoomRectForScale:(float)scale
              withCenter:(CGPoint)center {
    CGRect zoomRect;
    CGSize scrollViewSize = self.scrView.bounds.size;
    int pageIndex=_scrView.contentOffset.x/Photo_width;
    UIScrollView* scrItem=_scrView.subviews[pageIndex];
    
    zoomRect.size.height = scrollViewSize.height / scale;
    zoomRect.size.width  = scrollViewSize.width  / scale;
    
    // choose an origin so as to get the right center.
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    
    [scrItem zoomToRect:zoomRect
                       animated:YES];
    
    self.lblScale.text = [NSString stringWithFormat:@"%2.1f", self.scrView.zoomScale];
    
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    int pageIndex=_scrView.contentOffset.x/Photo_width;
    UIScrollView* scrItem=_scrView.subviews[pageIndex];
    UIImageView* imgItem=scrItem.subviews[0];
    return imgItem;
}
-(void)pageControlChange:(UIPageControl*) page{
    _scrView.contentOffset=CGPointMake(Photo_width*page.currentPage, 0);
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _pageControl.currentPage=_scrView.contentOffset.x/Photo_width;
}
@end
