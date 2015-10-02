//
//  FireCount.h
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/1/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import "Sprite.h"

@interface FireCount : Sprite
@property(nonatomic,copy) NSString* fireCountPrecent;
-(void)setValue:(id)value;
@end
