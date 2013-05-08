//
//  AppDelegate.h
//  rt-v.03
//
//  Created by Michael Hearne on 17/04/2013.
//  Copyright (c) 2013 Me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "NetworkEngine.h"

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

@class MoviesViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarDelegate>
{
    UITabBarController *tabBarController;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *gSearchQuery;
@property (strong, nonatomic) MoviesViewController *moviesViewController;
@property (strong, nonatomic) NetworkEngine *networkEngine;

@end