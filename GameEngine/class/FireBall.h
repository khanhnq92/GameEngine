//
//  FireBall.h
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/1/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import "Sprite.h"

@interface FireBall : Sprite
@property(nonatomic,assign)BOOL isFlying;
@property(nonatomic,assign)CGFloat speed;
@property(nonatomic,weak)Sprite* fromSprite;
-(void)startFly:(CGFloat)speed;
@end
