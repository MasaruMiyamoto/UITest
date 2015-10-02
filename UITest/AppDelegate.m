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
//#import "SelectButtons.h"
#import "ViewController.h"
#import "SetField.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



JudgeClass *Jclass;
ViewController *View;
SetButton *Button;
ViewClass *form;
SetField *Set;

@synthesize View;
@synthesize form;
@synthesize IsUpdate;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.toyBox = [[NSMutableDictionary alloc] init];
    Button = [[SetButton alloc] init];
    Jclass = [[JudgeClass alloc] init];
    form = [[ViewClass alloc] init];
    Set = [[SetField alloc] init];
//    [View randomAction:nil];
    return YES;
}

- (void)initToyBox{
    self.toyBox = [[NSMutableDictionary alloc] init];
}

- (void)upDate
{
//    NSLog(@"IsUpdate = %d", IsUpdate);
    
    switch (IsUpdate) {
        case 1:
            [self upDate1];
            break;
        case 2:
            [self upDate2];
            break;
        case 3:
            [self upDate3];
            break;
        case 4:
            [self upDate4];
            break;
        case 5:
            [self upDate5];
            break;
        case 6:
            [self upDate6];
            break;
        default:
            break;
    }
}

//倍数の入力と筆算クラスの生成
- (void)upDate1
{
//    NSLog(@"update 1");
    
    NSMutableArray *member = [self.toyBox objectForKey:@"formula"];
    for (ViewClass *fs in member) {
        [fs upDate];
//        NSLog(@"for in");
    }
    
//    NSLog(@"for out");
    if([Jclass judgeCheck:member[0] :member[1]] != 0){
        [Jclass setPosition:10 :252 + 768];
        [View.oya addSubview:Jclass];
        [View.oya bringSubviewToFront:Jclass];
        
        [AnimationClass fadeIn:Jclass :0];
        
//        NSLog(@"Jclass position.y = %f",Jclass.frame.origin.y);
//        NSLog(@"ちぇけらー！");
    }else{
        [Jclass resetPosition];
//        NSLog(@"ここ通った？");
    }
//    NSLog(@"1 mode");
}

//筆算の正否判定と割り算クラスの生成
- (void)upDate2
{
//    NSLog(@"2 mode");
//    NSLog(@" %d",[form checkSum]);

    if([form checkSum]){
        [self initToyBox];
        ViewClass *Cf = [[ViewClass alloc] init];
        Cf = [Cf copyWithPosition: form: 91: 510 +768];
        [Cf changeMode:@"divisionLabel"];
//        NSLog(@" %@",Cf.B.text);
        [View.oya addSubview:Cf];
        
        [AnimationClass fadeIn:Cf :0];
        
//        [self setUpdateMode:@"upDate3"];
        [Button isMove:false];
    }
}

//割り算の解答と代入クラスの生成
- (void)upDate3
{
    NSLog(@"3 mode");
    [Button isMove:true];
    
    if([form checkDiv]){
//        NSLog(@"Div OK");
        ViewClass *f3 = [[ViewClass alloc] init];
        f3 = [f3 copyWithPosition:form :91 :639 + 768];
        [f3 changeMode:@"solutionMode"];
        
//        [f3 setAns:form.X :form.Mul :91 :639 +768];
        
        [View.oya addSubview:f3];
        
        [Button isMove:false];
        [AnimationClass fadeIn:f3 :0];
        [AnimationClass delay:2];
        
        [View newScroll];
        [Set thirdSet:View.oya :f3];
        
    }
}

- (void)upDate4
{
    NSLog(@"update 4");
    [Button isMove:true];
//    NSLog(@"%@",form.A.text);
    [form substitution];
    [View.oya bringSubviewToFront:form];
    [AnimationClass delay:1];
    
    //移項モードへ
    ViewClass *f4 = [[[ViewClass alloc] init] copyWithPosition:form :91 :form.frame.origin.y + 131];
    [f4 changeMode:@"transPositionSetMode"];
    [View.oya addSubview:f4];
    [AnimationClass fadeIn:f4 :0];
    
}

- (void)upDate5
{
    NSLog(@"update 5");
    if([form checkMul]){
        NSLog(@"OK Mul");
        [Button isMove:false];
        
        ViewClass *f5 = [[[ViewClass alloc] init] copyWithPosition:form :91 :form.frame.origin.y + 131];
        [f5 changeMode:@"transPositionMode"];
        [View.oya addSubview:f5];
        [AnimationClass fadeIn:f5 :0];
    }
}

- (void)upDate6
{
    NSLog(@"update 6");
    [Button isMove:true];
}

- (void)setUpdateMode:(NSString *)mode
{
    int x;
    
    if([mode isEqualToString:@"upDate1"])
        x = 1;
    else if([mode isEqualToString:@"upDate2"])
        x = 2;
    else if([mode isEqualToString:@"upDate3"])
        x = 3;
    else if([mode isEqualToString:@"upDate4"])
        x = 4;
    else if([mode isEqualToString:@"upDate5"])
        x = 5;
    else if([mode isEqualToString:@"upDate6"])
        x = 6;
    else {
        x = 0;
//        NSLog(@"IsUpdate = 0");
    }
    
    IsUpdate = x;
        NSLog(@"mode x = %d",x);
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
