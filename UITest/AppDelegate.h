//
//  AppDelegate.h
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationClass.h"

@class ViewController;
@class ViewClass;
@class JudgeClass;
@class SetButton;
@class SetField;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) NSMutableDictionary *toyBox;

@property (assign, nonatomic) int IsUpdate;


@property (retain, nonatomic) ViewController *View;
@property (retain, nonatomic) SetButton *Button;
@property (retain, nonatomic) ViewClass *form;
@property (retain, nonatomic) SetField *Set;

- (void)initToyBox;
- (void)upDate;
- (void)setUpdateMode:(NSString *)mode;
- (void)inputAns :(BOOL)XY :(int)val;

@end

