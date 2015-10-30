//
//  PinchRotate.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/19/15.
//  Copyright © 2015 KhanhNQ. All rights reserved.
//

#import "PinchRotate.h"
#import "UIImageView+Photo.h"
@interface PinchRotate ()

@end

@implementation PinchRotate

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView* imgBG=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"6.jpg"]];
    imgBG.center=self.view.center;
    [imgBG makeItCool];
    [imgBG addGestureRecognizer];
    [self.view addSubview:imgBG];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
