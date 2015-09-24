//
//  Sprite.h
//  GameEngine
//
//  Created by Huy Quang Ngo on 9/24/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Sence.h"
@class Sence;
@interface Sprite : NSObject
@property(nonatomic,strong) UIView* view;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,weak) Sence* sence;
- (instancetype)initWithName:(NSString*)name
                      ownView:(UIView*)view
                      inSence:(Sence*)sence;
-(void)animation;
@end
