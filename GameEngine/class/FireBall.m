//
//  FireBall.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/1/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import "FireBall.h"

@implementation FireBall
-(instancetype)initWithName:(NSString *)name inSence:(Sence *)sence{
    self=[super initWithName:name
                     ownView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fireball.png"]]
                     inSence:sence];
    return self;
}
-(void)startFly:(CGFloat)speed{
    if(!self.isFlying){
        self.isFlying=true;
        self.speed=speed;
        
    }
}
-(void)fly{
    if(!self.isFlying) return;
    CGFloat x=self.view.center.x+self.speed;
    if(x >self.sence.view.frame.size.width+self.view.frame.size.width*0.5){
        [self.sence removeSprite:self];
        return;
    }
    self.view.center=CGPointMake(x, self.view.center.y);
}
-(void)animation{
    [self fly];
}
@end
