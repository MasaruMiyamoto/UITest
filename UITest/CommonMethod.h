//
//  CommonMethod.h
//  UITest
//
//  Created by miyamoto masaru on 2015/11/26.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CommonMethod : NSObject

+ (int)inputInteger :(NSString *)str :(BOOL)flag;
+ (NSString *)outputString :(int)val :(BOOL)flag;

+ (void)setBorder :(UILabel *)origin;
+ (void)resetBorder :(UILabel *)origin;
+ (CGRect)cleanPosition :(CGRect)AB :(NSString *)XY;
+ (int)getChild :(int)child :(int)parent;
@end
