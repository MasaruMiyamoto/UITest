//
//  AnimationClass.h
//  UITest
//
//  Created by miyamoto masaru on 2015/05/22.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AnimationClass : NSObject

+ (void)moveAnime :(UIView *)lbl :(int)x :(int)y;
+ (void)movePosition :(UIView *)lbl :(int)x :(int)y;
+ (void)fadeIn :(id)x :(double)y;
+ (void)fadeOut :(id)x :(double)y;
+ (void) delay :(int)time;

@end
