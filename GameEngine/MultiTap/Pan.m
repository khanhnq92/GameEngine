//
//  Pan.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/19/15.
//  Copyright © 2015 KhanhNQ. All rights reserved.
//

#import "Pan.h"

@interface Pan ()

@end

@implementation Pan{
    UIImageView *imgTarget,*imgBullEye;
    int dem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dem=0;
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    imgBullEye=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BullEye.png"]];
    imgTarget=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Target.png"]];
    imgTarget.center=CGPointMake(self.view.bounds.size.width*0.5, self.view.bounds.size.height*0.5);
    imgBullEye.center=CGPointMake(self.view.bounds.size.width*0.5, 200);
    [self.view addSubview:imgTarget];
    [self.view addSubview:imgBullEye];
    
    imgBullEye.userInteractionEnabled=true;
    imgBullEye.multipleTouchEnabled=true;
    
    UIPanGestureRecognizer* panGS=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    [imgBullEye addGestureRecognizer:panGS];
}
-(void)onPan:(UIPanGestureRecognizer*)sender{
    CGPoint pointPan=[sender locationInView:self.view];
    CGPoint aointPan=[sender locationInView:sender.view];
    if (sender.state==UIGestureRecognizerStateBegan||sender.state==UIGestureRecognizerStateChanged) {
        imgBullEye.center=pointPan;
        [self checkBullEyeInTarget];
    }
}
-(void)checkBullEyeInTarget{
    CGFloat distanceDoubleSquare= powf(imgTarget.center.x -imgBullEye.center.x, 2)+powf(imgTarget.center.y-imgBullEye.center.y, 2);
    if(distanceDoubleSquare<9){
        [self animationView:true];
        NSLog(@"VAO ROI!");
    }else{
        [self animationView:false];
        NSLog(@"KHONG VAO ROI!");
    }
}
-(void)animationView:(BOOL) isAnimation{
    if (isAnimation&&dem<5){
            [UIView animateWithDuration:0.05 animations:^{
                imgTarget.center=CGPointMake(imgTarget.center.x-5, imgTarget.center.y);
//                imgBullEye.center=CGPointMake(imgBullEye.center.x-50, imgBullEye.center.y);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.05 animations:^{
                    imgTarget.center=CGPointMake(imgTarget.center.x+5, imgTarget.center.y);
//                    imgBullEye.center=CGPointMake(imgBullEye.center.x+50, imgBullEye.center.y);
                } completion:^(BOOL finished) {
                    dem++;
                    [self animationView:true];
                }];
            }];
    }else{
        dem=0;
    }
}
@end
