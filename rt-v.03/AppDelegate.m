//
//  AppDelegate.m
//  rt-v.03
//
//  Created by Michael Hearne on 17/04/2013.
//  Copyright (c) 2013 Me. All rights reserved.
//

#import "AppDelegate.h"
#import "MoviesViewController.h"
#import "NetworkEngine.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize moviesViewController = _moviesViewController;
@synthesize networkEngine, gSearchQuery;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    tabBarController = [[UITabBarController alloc] init];
    [tabBarController.delegate self];
    
    /* NETWORK SETUP */
    NSMutableDictionary *headerFields = [NSMutableDictionary dictionary];
    [headerFields setValue:@"iOS" forKey:@"x-client-identifier"];
    
    self.networkEngine = [[NetworkEngine alloc]
                          initWithHostName:BaseURL
                          customHeaderFields:nil];
    [self.networkEngine useCache];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
