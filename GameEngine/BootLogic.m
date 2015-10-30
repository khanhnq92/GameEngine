//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"SenceAndSprite", CLASS: @"SenceAndSprite"},
                                    @{TITLE: @"Thanh pho va may", CLASS: @"CityAndCloud"},
                                    
                          ]};
    NSDictionary* intermediate = @{SECTION: @"ScrollView", MENU: @[
                                    @{TITLE: @"ScrollView", CLASS: @"ScrollViewAnd"},
                                     @{TITLE: @"ContentSize", CLASS: @"ScrContenSize"},
                                    @{TITLE: @"SimpleScrollView", CLASS: @"SimpleScrollView"},
                                  ]};
    NSDictionary* advanced = @{SECTION: @"MultiTap", MENU: @[
                                    @{TITLE: @"Tap", CLASS: @"Tap"},
                                     @{TITLE: @"Pan", CLASS: @"Pan"},
                                     @{TITLE: @"PinchScale", CLASS: @"PinchScale"},
                                    @{TITLE: @"PinchRotate", CLASS: @"PinchRotate"},
                                    @{TITLE: @"Simultanous Recognizer", CLASS: @"SimultanousRecognizer"},
                                    @{TITLE: @"ImageRotate", CLASS: @"ImageRotate"},
                                    ]};
    
    mainScreen.menu = @[basic, intermediate, advanced];
    mainScreen.title = @"Menu";
    mainScreen.about = @"This is demo bootstrap demo app. It is collection of sample code of AVFoundation";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
