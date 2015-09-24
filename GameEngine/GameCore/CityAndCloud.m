//
//  CityAndCloud.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 9/24/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import "CityAndCloud.h"
#import <UIKit/UIKit.h>
#import "Cloud.h"
@interface CityAndCloud ()

@end

@implementation CityAndCloud{
    CGFloat deltaX;
    NSTimer* timer;
    Sprite* bgCity1,*bgCity2;
    Cloud* cloud1,*cloud2,*cloud3;
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [timer invalidate];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addView];
    timer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(runningGame) userInfo:nil repeats:true];
}
-(void)runningGame{
    if(bgCity1.view.frame.origin.x+bgCity1.view.frame.size.width<=0)
        bgCity1.view.frame=CGRectMake(bgCity2.view.frame.origin.x+bgCity2.view.frame.size.width-2, bgCity1.view.frame.origin.y, bgCity1.view.frame.size.width, bgCity1.view.frame.size.height);
    if(bgCity2.view.frame.origin.x+bgCity2.view.frame.size.width<=0)
        bgCity2.view.frame=CGRectMake(bgCity1.view.frame.origin.x+bgCity1.view.frame.size.width-2, bgCity2.view.frame.origin.y, bgCity2.view.frame.size.width, bgCity2.view.frame.size.height);
    
    CGPoint pointCity1=bgCity1.view.center;
    pointCity1.x-=1;
    bgCity1.view.center=pointCity1;
    
    CGPoint pointCity2=bgCity2.view.center;
    pointCity2.x-=1;
    bgCity2.view.center=pointCity2;
    
    [self gameLoop];
    
}
-(void)gameLoop{
    for (Sprite* obj in self.sprites.allValues) {
        [obj animation];
    }
}
-(void)addView{
    //
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    CGFloat  sizeStatusNavigation=[UIApplication sharedApplication].statusBarFrame.size.height+self.navigationController.navigationBar.frame.size.height;
    self.size=CGSizeMake(self.view.bounds.size.width,self.view.bounds.size.height-sizeStatusNavigation);
    //
    UIImage* imgCity=[UIImage imageNamed:@"city"];
    bgCity1=[[Sprite alloc] initWithName:@"city1"
                                 ownView:[[UIImageView alloc] initWithImage:imgCity]
                                 inSence:self];
    bgCity1.view.frame=CGRectMake(0, self.size.height-imgCity.size.height, imgCity.size.width, imgCity.size.height);
    
    bgCity2=[[Sprite alloc] initWithName:@"city2"
                                 ownView:[[UIImageView alloc] initWithImage:imgCity]
                                 inSence:self];
    bgCity2.view.frame=CGRectMake(imgCity.size.width-2, self.size.height-imgCity.size.height, imgCity.size.width, imgCity.size.height);
    
    [self.view addSubview:bgCity1.view];
    [self.view addSubview:bgCity2.view];
    
    UIImage* imgCloud1=[UIImage imageNamed:@"cloud1"];
    UIImage* imgCloud2=[UIImage imageNamed:@"cloud2"];
    UIImage* imgCloud3=[UIImage imageNamed:@"cloud3"];
    
    cloud1=[[Cloud alloc] initWithName:@"cloud1"
                               ownView:[[UIImageView alloc]initWithImage:imgCloud1]
                               inSence:self];
    cloud2=[[Cloud alloc] initWithName:@"cloud2"
                               ownView:[[UIImageView alloc]initWithImage:imgCloud2]
                               inSence:self];
    cloud3=[[Cloud alloc] initWithName:@"cloud3"
                               ownView:[[UIImageView alloc]initWithImage:imgCloud3]
                               inSence:self];
    
    cloud1.view.frame=CGRectMake(20, 10, 100, 100);
    cloud2.view.frame=CGRectMake(100, 5, 90, 90);
    cloud3.view.frame=CGRectMake(290, 20, 80, 80);
    
    cloud1.speed=1.2;
    cloud2.speed=1.5;
    cloud3.speed=1.7;
    [self addSprite:cloud1];
    [self addSprite:cloud2];
    [self addSprite:cloud3];
}
@end
