//
//  UIImageView+Photo.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/19/15.
//  Copyright © 2015 KhanhNQ. All rights reserved.
//

#import "UIImageView+Photo.h"

@implementation UIImageView (Photo)
- (void) makeItCool{
    [self.layer setBorderWidth:5.0f];
    [self.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.layer setShadowRadius:5.0f];
    [self.layer setShadowOpacity:.85f];
    [self.layer setShadowOffset:CGSizeMake(1.0f, 2.0f)];
    [self.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.layer setShouldRasterize:YES];
    [self.layer setMasksToBounds:NO];
}
- (void) addGestureRecognizer{
    self.userInteractionEnabled=true;
    self.multipleTouchEnabled=true;
    
    UIPinchGestureRecognizer* pinch=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch:)];
    
    UIRotationGestureRecognizer* rotate=[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(onRotate:)];
    
    [self addGestureRecognizer:pinch];
    [self addGestureRecognizer:rotate];
    
//    [pinch requireGestureRecognizerToFail:rotate];
}
-(void)onPinch:(UIPinchGestureRecognizer*)sender{
    [self adjustAnchorPointForGestureRecognizer:sender];
    if (sender.state==UIGestureRecognizerStateBegan||sender.state==UIGestureRecognizerStateChanged) {
        sender.view.transform=CGAffineTransformScale(sender.view.transform, sender.scale, sender.scale);
        sender.scale=1.0;
        
    }
}
-(void)onRotate:(UIRotationGestureRecognizer*)sender{
    [self adjustAnchorPointForGestureRecognizer:sender];
        if (sender.state==UIGestureRecognizerStateBegan||sender.state==UIGestureRecognizerStateChanged) {
            sender.view.transform=CGAffineTransformRotate(sender.view.transform, sender.rotation);
            sender.rotation=0.0;
        }
}
-(void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer*)sender{
    if(sender.state==UIGestureRecognizerStateBegan){
        UIView* piece=sender.view;
        CGPoint pInView=[sender locationInView:piece];
        CGPoint pParentView=[sender locationInView:piece.superview];
        
        piece.layer.anchorPoint=CGPointMake(pInView.x/piece.bounds.size.width, pInView.y/piece.bounds.size.height);
        piece.center=pParentView;
    }
}
@end
