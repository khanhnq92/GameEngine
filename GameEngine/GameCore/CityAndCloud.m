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
#import "Superricks.h"
#import "FireCount.h"
@interface CityAndCloud ()

@end

@implementation CityAndCloud{
    CGFloat deltaX;
    NSTimer* timer;
    Sprite* bgCity1,*bgCity2;
    Cloud* cloud1,*cloud2,*cloud3;
    Superricks* superMario;
    FireCount* fireCount;

}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [timer invalidate];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addView];
    timer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(runningGame) userInfo:nil repeats:true];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(killTimer) name:@"closeTimer" object:nil];
}
-(void)killTimer{
    [timer invalidate];
}
-(void)runningGame{
    NSLog(@"Timer Running from CityAndCloud!");
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
    
    //them mario
    superMario=[[Superricks alloc] initWithName:@"mario" inSence:self];
    superMario.y0=self.size.height-superMario.view.bounds.size.height*0.5-10;
    superMario.view.center=CGPointMake(self.size.width/2, superMario.y0);
    [self addSprite:superMario];
    
    //THem diem
    Sprite* pointImg=[[Sprite alloc] initWithName:@"firePointImg" ownView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"firePoint.png"]] inSence:self];
    Sprite* staffImg=[[Sprite alloc] initWithName:@"staffImg" ownView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"staff.png"]] inSence:self];
    
    pointImg.view.frame=CGRectMake(self.view.frame.size.width-140, self.view.frame.size.height/99, 35, 35);
    staffImg.view.frame=CGRectMake(pointImg.view.frame.origin.x+50, self.view.frame.size.height/99+7.5, 20, 20);
    
    [self addSprite:pointImg];
    [self addSprite:staffImg];
    
    fireCount=[[FireCount alloc ]initWithName:@"fireCount" inSence:self];
    fireCount.view.frame=CGRectMake(staffImg.view.frame.origin.x+30, self.view.frame.size.height/99+7.5, 32, 20);
    [fireCount setValue:@"20"];
    [self addSprite:fireCount];
}
@end
