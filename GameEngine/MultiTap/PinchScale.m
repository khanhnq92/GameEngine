//
//  PinchScale.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/19/15.
//  Copyright © 2015 KhanhNQ. All rights reserved.
//

#import "PinchScale.h"

@interface PinchScale ()

@end

@implementation PinchScale{
    UIImageView* imgBg;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.view.backgroundColor=[UIColor whiteColor];
    
    imgBg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"6.jpg"]];
    imgBg.frame=CGRectMake(self.view.center.x-160, self.view.center.y-240, 320, 480);
    imgBg.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:imgBg];
    
    UIPinchGestureRecognizer* pinchGS=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch:)];
    imgBg.userInteractionEnabled=true;
    imgBg.multipleTouchEnabled=true;
    [imgBg addGestureRecognizer:pinchGS];
    
}
-(void)onPinch:(UIPinchGestureRecognizer*)sender{
    if(sender.state==UIGestureRecognizerStateBegan||sender.state==UIGestureRecognizerStateChanged){
        [self adjustAnchorPointForGestureRecognizer:sender];
        imgBg.transform=CGAffineTransformScale(imgBg.transform, sender.scale, sender.scale);
        NSLog(@"OnPinCH");
        sender.scale=1.0;
    }
}
-(void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer*)sender{
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"adjust began");
    UIView *piece = sender.view;
    CGPoint locationInView = [sender locationInView:piece];
    CGPoint locationInSuperview = [sender locationInView:piece.superview];
    
    piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
    piece.center = locationInSuperview;
    }
    if (sender.state==UIGestureRecognizerStateChanged) {
        NSLog(@"adjust changed");
    }
}
@end
