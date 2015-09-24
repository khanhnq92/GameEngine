//
//  ViewController.h
//  GameEngine
//
//  Created by Huy Quang Ngo on 9/24/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sprite.h"
@class Sprite;
@interface Sence : UIViewController
@property(nonatomic,strong) NSMutableDictionary* sprites;
@property(nonatomic,assign) CGSize size;
-(void)addSprite:(Sprite*)sprite;
-(void)removeSprite:(Sprite *)sprite;
-(void)removeSpriteByName:(Sprite *)spriteName;
@end
