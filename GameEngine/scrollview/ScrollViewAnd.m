//
//  ScrollViewAnd.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/6/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import "ScrollViewAnd.h"

@interface ScrollViewAnd ()<UIScrollViewDelegate>
@end

@implementation ScrollViewAnd{
    UISlider* slider;
    UIImageView* photo;
    UIScrollView* scrView;
    UIToolbar* toolbar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    [self addSprite];
}
-(void)addSprite{
    toolbar=[[UIToolbar alloc] init];
    [toolbar sizeToFit];
    slider=[[UISlider alloc]  initWithFrame:CGRectMake(9, 0, self.view.frame.size.width-16, 40)];
    slider.minimumValue=0.2;
    slider.maximumValue=5.0;
    slider.value=1;
    [slider addTarget:self action:@selector(sliderChange) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem* barItem=[[UIBarButtonItem alloc] initWithCustomView:slider];
    toolbar.items=@[barItem];
    toolbar.frame=CGRectMake(0, 0, toolbar.bounds.size.width,toolbar.bounds.size.height);
    [self.view addSubview:toolbar];
    
    
    photo=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"city.png"]];
    scrView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, toolbar.bounds.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    [scrView addSubview:photo];
    [self.view addSubview:scrView];
    scrView.delegate=self;
    scrView.minimumZoomScale=slider.minimumValue;
    scrView.maximumZoomScale=slider.maximumValue;
    scrView.zoomScale=slider.value;
}
-(void)sliderChange{
    [scrView  setZoomScale:slider.value animated:true];
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return photo;
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    slider.value=scrView.zoomScale;
}
@end
