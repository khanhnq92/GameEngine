//
//  Cloud.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 9/24/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import "Cloud.h"

@implementation Cloud
-(void)animation{
    self.view.center=CGPointMake(self.view.center.x-self.speed, self.view.center.y);
    if(self.view.frame.origin.x+self.view.frame.size.width<0.0){
        self.view.center=CGPointMake(self.sence.size.width+self.view.frame.size.width*0.5, self.view.center.y);
    }
}
@end
