//
//  AppDelegate.h
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class ViewClass;
@class JudgeClass;
@class SetButton;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) NSMutableDictionary *toyBox;
@property (retain, nonatomic) ViewController *View;
@property (retain, nonatomic) SetButton *Button;
@property (retain, nonatomic) ViewClass *form;

- (void)initToyBox;
- (void)upDate;
- (void)upDate2;
- (void)upDate3;
@end

