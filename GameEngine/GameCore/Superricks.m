//
//  Superricks.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 9/24/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import "Superricks.h"
#import "FireCount.h"
#import "FireBall.h"
@implementation Superricks{
    BOOL isRunning, isJupminng,isSingleTap;
    CGFloat jumpvelocity,fallacceleration;
    FireBall* fireBall;
    int fireCount;
}
-(instancetype)initWithName:(NSString *)name inSence:(Sence *)sence{
    self=[super initWithName:name inSence:sence];
    UIImageView* vMario=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 65, 102)];
    vMario.userInteractionEnabled=YES;
    vMario.multipleTouchEnabled=YES;
    vMario.animationImages=@[[UIImage imageNamed:@"1.png"],
                             [UIImage imageNamed:@"2.png"],
                             [UIImage imageNamed:@"3.png"],
                             [UIImage imageNamed:@"4.png"],
                             [UIImage imageNamed:@"5.png"],
                             [UIImage imageNamed:@"6.png"],
                             [UIImage imageNamed:@"7.png"],
                             [UIImage imageNamed:@"8.png"],
                             ];
    vMario.animationDuration=1.0;
    [vMario startAnimating];
    fireCount=0;
    self.view=vMario;
    [self applyGestureRecognizer];
    self.alive=true;
    return self;
}
-(void)applyGestureRecognizer{
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget : self action : @selector (handleDoubleTap)];
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget : self action : @selector (startJump)];

    [singleTap requireGestureRecognizerToFail : doubleTap];
    [doubleTap setDelaysTouchesBegan : YES];
    [singleTap setDelaysTouchesBegan : YES];
    
    [doubleTap setNumberOfTapsRequired : 2];
    [singleTap setNumberOfTapsRequired : 1];
    
    [self.sence.view addGestureRecognizer:singleTap];
    [self.sence.view addGestureRecognizer:doubleTap];
    
    UISwipeGestureRecognizer* swipeRight=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(fire)];
    swipeRight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.sence.view addGestureRecognizer:swipeRight];
}
-(void)fire{
    FireCount* obj= [self.sence.sprites objectForKey:@"fireCount"];
    int fireCountPrecent=[obj.fireCountPrecent intValue];
    if(fireCountPrecent>=1){
        fireCountPrecent-=1;
        [obj setValue:[NSString stringWithFormat:@"%d",fireCountPrecent]];
        fireCount++;
        fireBall=[[FireBall alloc]initWithName:[NSString stringWithFormat:@"fireBall%d",fireCount] inSence:self.sence];
        fireBall.view.center=CGPointMake(self.view.center.x+5, self.view.center.y);
        fireBall.fromSprite=self;
        [self.sence addSprite:fireBall];
        [fireBall startFly:5];
    }
}
-(void)handleDoubleTap{
    if(isSingleTap){
        isJupminng=true;
        isSingleTap=false;
        jumpvelocity=-5.0;
        fallacceleration=0.08;
        
        CABasicAnimation* rotationAnimation;
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
        rotationAnimation.duration = 0.8;
//        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount = 1;
        
        [self.view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    }
}
-(void)startJump{
    if(!isJupminng){
        isJupminng=true;
        isSingleTap=true;
        jumpvelocity=-5.0;
        fallacceleration=0.08;
    }
}
-(void)jump{
    if (!isJupminng) {
        return;
    }
    CGFloat y=self.view.center.y;
    y+=jumpvelocity;
    jumpvelocity+=fallacceleration;
    if(y>self.y0){
        y=self.y0;
        isJupminng=false;
        isSingleTap=false;
    }
    self.view.center=CGPointMake(self.view.center.x, y);
}
-(void)animation{
    if (!self.alive) {
        return;
    }
    [self jump];
}
@end
