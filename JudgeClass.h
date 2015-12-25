//
//  JudgeClass.h
//  UITest
//
//  Created by miyamoto masaru on 2015/02/27.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonMethod.h"
@class ViewClass;

@interface JudgeClass : UIView

- (void)setPosition:(int)x :(int)y;
- (void)resetPosition;
- (BOOL)enterCheck;
- (int)judgeCheck:(ViewClass *)f1 :(ViewClass *)f2;

- (BOOL) checkPL;
- (void) makeCulClass;
@end
