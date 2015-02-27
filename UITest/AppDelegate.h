//
//  AppDelegate.h
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewClass;
@class JudgeClass;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) NSMutableDictionary *toyBox;
@property (retain, nonatomic) UIViewController *View;

- (void)initToyBox;
- (void)upDate;
@end

