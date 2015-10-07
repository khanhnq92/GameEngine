//
//  ScrContenSize.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/6/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import "ScrContenSize.h"

@interface ScrContenSize ()

@end

@implementation ScrContenSize{
    UIImageView* imgView;
    UIScrollView* scrView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    
    UIImage* img=[UIImage imageNamed:@"people.jpg"];
    
    imgView=[[UIImageView alloc]initWithImage:img];
    scrView=[[UIScrollView alloc] initWithFrame:CGRectMake(8, 200, self.view.frame.size.width-16, 150)];
    
    scrView.bounces=false;
//    scrView.showsHorizontalScrollIndicator=true;
//    scrView.showsVerticalScrollIndicator=true;
    scrView.contentSize=CGSizeMake(img.size.width, img.size.height);
    
    [scrView addSubview:imgView];
    [self.view addSubview:scrView];
}

@end
