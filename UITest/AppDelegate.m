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
#import "SelectButtons.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


JudgeClass *Jclass;
ViewController *View;
SetButton *Button;
ViewClass *form;

@synthesize View;
@synthesize form;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.toyBox = [[NSMutableDictionary alloc] init];
    Button = [[SetButton alloc] init];
    Jclass = [[JudgeClass alloc] init];
//    formula = [[ViewClass alloc] init];
    
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
        NSLog(@"for in");
    }
    
//    NSLog(@"for out");
    if([Jclass judgeCheck:member[0] :member[1]] != 0){

        [Jclass setPosition:10 :252 + 768];
//        [Button setUpdateMode:@"upDate2"];
        [View.oya addSubview:Jclass];
//        NSLog(@"ちぇけらー！");
    }else{
        [Jclass resetPosition];
    }
    NSLog(@"1 mode");
}

- (void)upDate2
{
    NSLog(@"2 mode");
    NSLog(@" %d",[form checkSum]);
//    [self initToyBox];
    if([form checkSum]){
        [self initToyBox];
        ViewClass *Cf = [[ViewClass alloc] init];
        Cf = [Cf copyWithPosition: form: 91: 450 +768];
        [Cf levelingLabel:Cf];
//        NSLog(@" %@",Cf.B.text);
        [View.oya addSubview:Cf];
        [Button setUpdateMode:@"upDate3"];
    }
}

- (void)upDate3
{
    NSLog(@"3 mode");
    if([form checkDiv])
        NSLog(@"Div OK");
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
