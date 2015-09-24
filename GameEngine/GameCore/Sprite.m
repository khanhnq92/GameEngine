//
//  Sprite.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 9/24/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import "Sprite.h"

@implementation Sprite
- (instancetype)initWithName:(NSString*)name
                      ownView:(UIView*)view
                     inSence:(Sence*)sence{
    if(self==[super init]){
        self.name=name;
        self.view=view;
        self.sence=sence;
    }
    return self;
}
-(void)animation{
    
}
@end
