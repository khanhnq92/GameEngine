//
//  Tap.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/19/15.
//  Copyright © 2015 KhanhNQ. All rights reserved.
//

#import "Tap.h"

@interface Tap ()

@end

@implementation Tap

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    UIImageView* bg=[[UIImageView alloc] initWithFrame:self.view.bounds];
    bg.image=[UIImage imageNamed:@"grass.png"];
    [self.view addSubview:bg];
    
    bg.userInteractionEnabled=true;
    UITapGestureRecognizer* tab=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [bg addGestureRecognizer:tab];
}
-(void)onTap:(UITapGestureRecognizer*)sender{
    CGPoint pointTap=[sender locationInView:self.view];
    UIImageView* bg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ant.png"]];
    bg.center=pointTap;
    [self.view addSubview:bg];
}
@end
