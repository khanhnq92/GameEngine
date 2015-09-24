//
//  SenceAndSprite.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 9/24/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import "SenceAndSprite.h"
#import "Sprite.h"
#import "Cloud.h"
@interface SenceAndSprite ()

@end

@implementation SenceAndSprite{
    CGSize sizeMain;
    Sprite* spBall;
    NSTimer* timer;
    CGFloat thayDoi,angle,detaAngle;
    
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [timer invalidate];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addView];
    thayDoi=1;
    detaAngle=0.4;
    timer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(ballAnimation) userInfo:nil repeats:true];
}
-(void) ballAnimation{
    if(spBall.view.frame.origin.x+spBall.view.frame.size.width>=sizeMain.width)
    {
        thayDoi=-thayDoi;
        detaAngle=-detaAngle;
    }
    if (spBall.view.frame.origin.x<=0){
        thayDoi=-thayDoi;
        detaAngle=-detaAngle;
    }
    angle+=detaAngle;
    spBall.view.center=CGPointMake(spBall.view.center.x+thayDoi, spBall.view.center.y);
    spBall.view.transform=CGAffineTransformMakeRotation(angle);
}
-(void)addView{
//
    self.view.backgroundColor=[UIColor grayColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    CGFloat  sizeStatusNavigation=[UIApplication sharedApplication].statusBarFrame.size.height+self.navigationController.navigationBar.frame.size.height;
    sizeMain=CGSizeMake(self.view.bounds.size.width,self.view.bounds.size.height-sizeStatusNavigation);
    
//ball
    UIImage* imgBall=[UIImage imageNamed:@"soccer"];
    spBall=[[Sprite alloc] initWithName:@"ball"
                                        ownView:[[UIImageView alloc] initWithImage:imgBall]
                                        inSence:self];
    spBall.view.frame=CGRectMake(sizeMain.width/2-imgBall.size.width/2,sizeMain.height/2 -imgBall.size.height/2, imgBall.size.width, imgBall.size.height);
    [self.view addSubview:spBall.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
