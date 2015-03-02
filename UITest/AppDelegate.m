//
//  AppDelegate.m
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewClass.h"
#import "JudgeClass.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize View;

JudgeClass *Jclass;
ViewController *View;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.toyBox = [[NSMutableDictionary alloc] init];
    Jclass = [[JudgeClass alloc] init];
    return YES;
}

- (void)initToyBox{
    self.toyBox = [[NSMutableDictionary alloc] init];
}

- (void)upDate
{
//    NSLog(@"update");
    
    NSMutableArray *member = [self.toyBox objectForKey:@"formula"];
    for (ViewClass *fs in member) {
        [fs upDate];
//        NSLog(@"for in");
    }
    
//    NSLog(@"for out");
    if([Jclass judgeCheck:member[0] :member[1]] != 0){
//        NSLog(@"flag = %d",[Jclass judgeCheck:member[0] :member[1]]);
//        NSLog(@"hoge");
        [Jclass setPosition:10 :252 + 768];
        [View.oya addSubview:Jclass];
        
    }else{
        [Jclass resetPosition];
    }
    
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
