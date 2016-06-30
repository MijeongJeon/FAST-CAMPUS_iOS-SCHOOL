//
//  AppDelegate.m
//  NetworkMiniProject(107)
//
//  Created by Mijeong Jeon on 6/22/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    // pch 테스트
    NSLog(@"언제나 보이는 로그");
    
    LOG_LEV_ONE(@"로그 레벨 1");
    LOG_LEV_TWO(@"로그 레벨 2");
    
    // 디바이스 버전 정보
    NSString *version = [[UIDevice currentDevice] systemVersion];
    NSString *model = [[UIDevice currentDevice] model];
    
    NSLog(@"%@", version);
    NSLog(@"%@", model);
    
    // 어플 버전 정보
    NSURL *infoURL = [[NSBundle mainBundle] URLForResource:@"Info" withExtension:@"plist"];
    NSDictionary *infoDic = [NSDictionary dictionaryWithContentsOfURL:infoURL];
    
    NSLog(@"%@", infoDic);
    NSLog(@"%@", infoDic[@"CFBundleShortVersionString"]);
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    MainViewController *mainViewController = [[MainViewController alloc] init];
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    
    [self.window setRootViewController:naviController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
