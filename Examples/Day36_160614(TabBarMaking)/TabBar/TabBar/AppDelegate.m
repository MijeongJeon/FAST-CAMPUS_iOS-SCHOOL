//
//  AppDelegate.m
//  TabBar
//
//  Created by Mijeong Jeon on 6/14/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    // view 생성
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    
    // 탭바 컨트롤러 생성
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
  
    // 탭바 아이템 설정
    firstViewController.tabBarItem.title = @"HOME";
    secondViewController.tabBarItem.title = @"CLOUD";
    firstViewController.tabBarItem.image = [UIImage imageNamed:@"home"];
    secondViewController.tabBarItem.image = [UIImage imageNamed:@"cloud"];
    
    // navi 생성
    UINavigationController *naviForHome = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    
    // 탭바 컨트롤러에 뷰 삽입
    [tabBarController setViewControllers:@[naviForHome, secondViewController]];

    // 윈도우 객체 생성 및 탭바 컨트롤러 삽입
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarController;
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
