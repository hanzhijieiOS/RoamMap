//
//  AppDelegate.m
//  RoamMap
//
//  Created by Jay on 2017/12/2.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>

#import "RMCoordinateManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.mapManager = [[BMKMapManager alloc] init];
    BOOL ret = [self.mapManager start:@"icQj863ocAw5DD4BXHnPQwFQid2m3PXe" generalDelegate:nil];
    if (!ret) {
        NSLog(@"Map is not Ready");
    }
    
    [[RMCoordinateManager sharedManager] fetchPointWithLongitude:34.555 Latitude:108.906 Range:100 succeed:^(RMGetPointModel *pointModel) {
        
    } error:^(NSError *error) {
        
    }];
    
    
    
    
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:vc];
    [nv.navigationBar setBackgroundColor:[UIColor whiteColor]];
    self.window.rootViewController = nv;
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
