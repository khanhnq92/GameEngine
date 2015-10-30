//
//  ImageRotate.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/30/15.
//  Copyright © 2015 KhanhNQ. All rights reserved.
//

#import "ImageRotate.h"

@interface ImageRotate ()
@property (weak, nonatomic) IBOutlet UIImageView *imgPhone;

@end

@implementation ImageRotate{
    NSMutableArray* arrImgLeft,*arrImgRight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSprite];
}

-(void)addSprite{
    arrImgLeft=[NSMutableArray new];
    arrImgRight=[NSMutableArray new];
    for (int i=1; i<=36; i++) {
        [arrImgLeft addObject:[UIImage imageNamed:[NSString stringWithFormat:@"iphone-6-plus-16gb-360-org-%d.jpg",i]]];
        [arrImgRight addObject:[UIImage imageNamed:[NSString stringWithFormat:@"iphone-6-plus-16gb-360-org-%d.jpg",37-i]]];
    }
    
    
    
    _imgPhone.animationImages=arrImgLeft;
    _imgPhone.animationDuration=8;
    _imgPhone.animationRepeatCount=0;
    [_imgPhone startAnimating];
    _imgPhone.userInteractionEnabled=true;
    UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TangToc)];
    [_imgPhone addGestureRecognizer:tap];
}
-(void)TangToc{
//    [_imgPhone ];
//    _imgPhone.animationImages=arrImgRight;
//    _imgPhone.animationDuration=8;
//    _imgPhone.animationRepeatCount=0;
//    [_imgPhone startAnimating];
    NSLog(@"tap");
}
@end
