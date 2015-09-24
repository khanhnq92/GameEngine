
//
//  ViewController.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 9/24/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import "Sence.h"

@interface Sence ()

@end

@implementation Sence
#pragma mark - define method
- (void)addSprite:(Sprite *)sprite{
    [_sprites setObject:sprite
                 forKey:sprite.name];
    [self.view addSubview:sprite.view];
}
-(void)removeSprite:(Sprite *)sprite{
    [_sprites removeObjectForKey:sprite.name];
    [sprite.view removeFromSuperview];
}
-(void) removeSpriteByName:(Sprite *)spriteName{
    [_sprites removeObjectForKey:spriteName];
    UIView* sprite=_sprites[spriteName];
    [sprite removeFromSuperview];
}
#pragma mark - main sence
-(void)loadView{
    [super loadView];
    _sprites=[NSMutableDictionary new];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
