//
//  SimultanousRecognizer.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/20/15.
//  Copyright © 2015 KhanhNQ. All rights reserved.
//

#import "SimultanousRecognizer.h"

@interface SimultanousRecognizer ()<UIGestureRecognizerDelegate>

@end

@implementation SimultanousRecognizer{
    UIImageView* imgEye;
    NSTimer* timer;
    NSDate* whenBullEyeBecomeBlue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    imgEye=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BullEye.png"]];
    imgEye.center=self.view.center;
    
    imgEye.userInteractionEnabled=true;
    imgEye.multipleTouchEnabled=true;
    
    
    UIPanGestureRecognizer* pan=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    [imgEye addGestureRecognizer:pan];
    
    UISwipeGestureRecognizer* swipe=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight |
    UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionUp;
    
    [imgEye addGestureRecognizer:swipe];
    
    UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap:)];
    [imgEye addGestureRecognizer:tap];
    
    [pan requireGestureRecognizerToFail:swipe];
    
    [self.view addSubview:imgEye];
    
    
    timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(loop) userInfo:nil repeats:true];
}
-(void)onTap:(UITapGestureRecognizer*)sender{
    if (sender.state==UIGestureRecognizerStateRecognized) {
        NSLog(@"Tap");
    }
}
-(void)onSwipe:(UISwipeGestureRecognizer*)sender{
    if (sender.state==UIGestureRecognizerStateRecognized) {
        NSLog(@"Swipe");
        whenBullEyeBecomeBlue=[NSDate date];
        imgEye.image=[UIImage imageNamed:@"blueBullEye.png"];
    }
}
-(void)onPan:(UIPanGestureRecognizer*)sender{
    if (sender.state==UIGestureRecognizerStateRecognized||sender.state==UIGestureRecognizerStateChanged) {
        NSLog(@"Pan");
        imgEye.center=[sender locationInView:self.view];
    }
}
-(void)loop{
    if (whenBullEyeBecomeBlue) {
        NSTimeInterval timeVal=[whenBullEyeBecomeBlue timeIntervalSinceNow];
        if(-timeVal>0.2)
            imgEye.image=[UIImage imageNamed:@"BullEye.png"];
    }
}
//-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//    return false;
//}
@end
