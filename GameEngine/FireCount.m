//
//  FireCount.m
//  GameEngine
//
//  Created by Huy Quang Ngo on 10/1/15.
//  Copyright (c) 2015 KhanhNQ. All rights reserved.
//

#import "FireCount.h"

@implementation FireCount{
    UILabel* ViewPoint;
}
-(void)awakeFromNib{
    [super awakeFromNib];

}
-(instancetype)initWithName:(NSString *)name inSence:(Sence *)sence{
    ViewPoint=[[UILabel alloc] init];
    ViewPoint.font=[UIFont fontWithName:@"Menlo" size:19];
    ViewPoint.textColor=[UIColor redColor];
    self=[super initWithName:name
                     ownView:ViewPoint
                     inSence:sence];
    return self;
}
-(void)setValue:(id)value{
    self.fireCountPrecent=(NSString*)value;
    ViewPoint.text=self.fireCountPrecent;
}
-(void)animation{
    ViewPoint.text=self.fireCountPrecent;
}
@end
